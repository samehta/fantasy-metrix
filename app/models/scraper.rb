class Scraper

  def self.go
    puts "Scraping started ..."
    qb_urls = ['http://www.rotoworld.com/player/nfl/1163/tom-brady', 
               'http://www.rotoworld.com/player/nfl/9360/jimmy-garoppolo']
    qb_urls.each do |url|
      url = "http://www.rotoworld.com/player/nfl/1163/tom-brady"
      page = Nokogiri::HTML(open(url))
      table = page.css('th:contains("Game Log")').first.ancestors('table')
      stats_rows = table.css("tr")[3..-1]

      year = 2015
      previous_date = Date.new(2015, 1, 1)
      player = Player.find_or_create_by!(name: 'Tom Brady')

      stats_rows.each do |row|
        cells = row.css("td")
        week = cells[0].text.to_i

        date = (cells[1].text + " #{year}").to_date
        if previous_date > date
          year = year + 1
          date = (cells[1].text + " #{year}").to_date
        end
        previous_date = date

        opponent = cells[2].text
        completions = cells[3].text.to_i
        passing_attempts = cells[4].text.to_i
        passing_yards = cells[6].text.to_i
        passing_touchdowns = cells[8].text.to_i
        interceptions = cells[9].text.to_i
        rushing_attempts = cells[10].text.to_i
        rushing_yards = cells[11].text.to_i
        rushing_touchdowns = cells[13].text.to_i
        
        passing_game_log = player.passing_game_logs.find_or_initialize_by(week: week)
        passing_game_log.update_attributes!(
          season: year, date: date, opponent: opponent, completions: completions,
          passing_attempts: passing_attempts, passing_yards: passing_yards,
          passing_touchdowns: passing_touchdowns, interceptions: interceptions,
          rushing_attempts: rushing_attempts, rushing_yards: rushing_yards,
          rushing_touchdowns: rushing_touchdowns
        )
      end
    end
    p player.passing_game_logs
  end

end