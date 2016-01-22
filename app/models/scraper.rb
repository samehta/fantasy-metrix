class Scraper

  def self.go
    puts "Begin scraping..."
    qb_urls = ['http://www.rotoworld.com/player/nfl/2550/carson-palmer',
               'http://www.rotoworld.com/player/nfl/4637/matt-ryan',
               'http://www.rotoworld.com/player/nfl/6491/cam-newton',
               'http://www.rotoworld.com/player/nfl/3608/jay-cutler',
               'http://www.rotoworld.com/player/nfl/1493/peyton-manning',
               'http://www.rotoworld.com/player/nfl/5132/matthew-stafford',
               'http://www.rotoworld.com/player/nfl/3118/aaron-rodgers',
               'http://www.rotoworld.com/player/nfl/1163/tom-brady', 
               'http://www.rotoworld.com/player/nfl/9320/blake-bortles',
               'http://www.rotoworld.com/player/nfl/3119/alex-smith',
               'http://www.rotoworld.com/player/nfl/591/drew-brees',
               'http://www.rotoworld.com/player/nfl/1657/eli-manning',
    # url = page.css('div[id=cp1_pnlDepthCharts] table a')[1]['href']

    qb_urls.each do |url|
      page = Nokogiri::HTML(open(url))
      player_name = page.css('div.playername').text.match(/(.+) \|/)[1]
      team_name = page.css('td:contains("Team:")').first.ancestors('tr').css('a').text
      position = page.css('div.playername').text.match(/\| (.+)/)[1]
      date_of_birth_str = page.css('td:contains("DOB:")').first.ancestors('tr').css('td').last.text.match(%r{(\d\d?/\d\d?/\d\d\d\d)})[1]
      date_of_birth = DateTime.strptime(date_of_birth_str, '%m/%d/%Y')
      height = page.css('td:contains("Ht")').first.ancestors('tr').css('td').last.text.match(/(.+) \//)[1]
      weight = page.css('td:contains("Wt:")').first.ancestors('tr').css('td').last.text.match(/\/ (.+)/)[1].to_i
      college = page.css('td:contains("College:")').first.ancestors('tr').css('td').last.text
      team_image = team_name.downcase.split(' ').join('_')
      player_image = player_name.downcase.split(' ').join('_') + ".png"

      team = Team.find_or_create_by!(name: team_name)
      player = team.players.find_or_create_by!(name: player_name)
      player.update_attributes!(position: position, date_of_birth: date_of_birth, height: height, 
                                weight: weight, college: college, image_path: "#{team_image}/#{player_image}")

      table = page.css('th:contains("Game Log")').first.ancestors('table')
      stats_rows = table.css("tr")[3..-1]

      year = 2015
      previous_date = Date.new(2015, 1, 1)

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
      p player.passing_game_logs
    end
  end

end