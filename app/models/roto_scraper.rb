class RotoScraper

  POSITION_PATTERN = /\| (.+?)(\z| \|)/

  def self.go
    puts "Begin scraping team urls.."
    # TEAMS LISTING: http://www.rotoworld.com/sports/nfl/football
    team_urls = ["http://www.rotoworld.com/teams/clubhouse/nfl/cin/cincinnati-bengals",
                 "http://www.rotoworld.com/teams/clubhouse/nfl/cle/cleveland-browns"]

    team_urls.each do |team_url|
      team_page = Nokogiri::HTML(open(team_url))
      anchors = team_page.css('table[id=cp1_ctl04_tblDepthCharts] a')
      anchors.each do |anchor|
        rotoworld = "http://www.rotoworld.com"
        player_url = rotoworld + "#{anchor['href']}"
        puts player_url
        page = Nokogiri::HTML(open(player_url))

        position = extract_position(page.css('div.playername').text)
        if !['Quarterback', 'Running Back', 'Wide Receiver', 'Tight End'].include?(position)
          next
        end

        player_name = page.css('div.playername').text.match(/(.+?) \|/)[1]
        team_name = page.css('td:contains("Team:")').first.ancestors('tr').css('a').text
        date_of_birth_str = page.css('td:contains("DOB:")').first.ancestors('tr').css('td').last.text.match(%r{(\d\d?/\d\d?/\d\d\d\d)})[1]
        date_of_birth = DateTime.strptime(date_of_birth_str, '%m/%d/%Y')
        height = page.css('td:contains("Ht")').first.ancestors('tr').css('td').last.text.match(/(.+)\' /)[1]
        weight = page.css('td:contains("Wt:")').first.ancestors('tr').css('td').last.text.match(/\/ (.+)/)[1].to_i
        college = page.css('td:contains("College:")').first.ancestors('tr').css('td').last.text
        team_image = team_name.downcase.split(' ').join('_')
        player_image = player_name.downcase.split(' ').join('_') + ".png"

        team = Team.find_or_create_by!(name: team_name)
        player = team.players.find_or_create_by!(name: player_name)
        player.update_attributes!(position: position, date_of_birth: date_of_birth, height: height, 
                                  weight: weight, college: college, image_path: "#{team_image}/#{player_image}")
        
        career_stat_table = page.css('th:contains("Career Stats")').first.ancestors('table')
        career_stat_rows = career_stat_table.css("tr")[3..-1]

        game_log_table = page.css('th:contains("Game Log")').first.ancestors('table')
        game_log_rows = game_log_table.css("tr")[3..-1]

        year = 2015
        previous_date = Date.new(2015, 1, 1)


        if player.quarterback?
          career_stat_rows.each do |row|
            cells = row.css("td")
            year = cells[0].text.to_i
            team = cells[1].text
            games_played = cells[2].text.to_i
            completions = cells[3].text.to_i
            passing_attempts = cells[4].text.to_i
            passing_yards = cells[6].text.to_i
            three_hundred_plus = cells[9].text.to_i
            passing_touchdowns = cells[10].text.to_i
            interceptions = cells[11].text.to_i
            rushing_attempts = cells[12].text.to_i
            rushing_yards = cells[13].text.to_i
            rushing_touchdowns = cells[16].text.to_i
            career_passing_stat = player.career_passing_stats.find_or_initialize_by(year: year)
            career_passing_stat.update_attributes!(
              team: team, games_played: games_played, completions: completions,
              passing_attempts: passing_attempts, passing_yards: passing_yards,
              three_hundred_plus: three_hundred_plus, passing_touchdowns: passing_touchdowns, 
              interceptions: interceptions, rushing_attempts: rushing_attempts, 
              rushing_yards: rushing_yards, rushing_touchdowns: rushing_touchdowns)
          end

          game_log_rows.each do |row|
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
              season: 2015, date: date, opponent: opponent, completions: completions,
              passing_attempts: passing_attempts, passing_yards: passing_yards,
              passing_touchdowns: passing_touchdowns, interceptions: interceptions,
              rushing_attempts: rushing_attempts, rushing_yards: rushing_yards,
              rushing_touchdowns: rushing_touchdowns)
          end
        end


        if player.running_back?
          game_log_rows.each do |row|
            cells = row.css("td")
            week = cells[0].text.to_i
            date = (cells[1].text + " #{year}").to_date
            if previous_date > date
              year = year + 1
              date = (cells[1].text + " #{year}").to_date
            end
            previous_date = date
            opponent = cells[2].text
            rushing_attempts = cells[3].text.to_i
            rushing_yards = cells[4].text.to_i
            rushing_touchdowns = cells[6].text.to_i
            receptions = cells[7].text.to_i
            receiving_yards = cells[8].text.to_i
            receiving_touchdowns= cells[10].text.to_i
            rushing_game_log = player.rushing_game_logs.find_or_initialize_by(week: week)
            rushing_game_log.update_attributes!(
              season: 2015, date: date, opponent: opponent, rushing_attempts: rushing_attempts,
              rushing_yards: rushing_yards, rushing_touchdowns: rushing_touchdowns, receptions: receptions, 
              receiving_yards: receiving_yards, receiving_touchdowns: receiving_touchdowns)
          end
        end


        if player.wide_receiver?
          game_log_rows.each do |row|
            cells = row.css("td")
            week = cells[0].text.to_i
            date = (cells[1].text + " #{year}").to_date
            if previous_date > date
              year = year + 1
              date = (cells[1].text + " #{year}").to_date
            end
            previous_date = date
            opponent = cells[2].text
            receptions = cells[3].text.to_i
            receiving_yards = cells[4].text.to_i
            receiving_touchdowns = cells[6].text.to_i
            rushing_attempts = cells[7].text.to_i
            rushing_yards = cells[8].text.to_i
            rushing_touchdowns= cells[10].text.to_i
            receiving_game_log = player.receiving_game_logs.find_or_initialize_by(week: week)
            receiving_game_log.update_attributes!(
              season: 2015, date: date, opponent: opponent, receptions: receptions, 
              receiving_yards: receiving_yards, receiving_touchdowns: receiving_touchdowns, 
              rushing_attempts: rushing_attempts, rushing_yards: rushing_yards, 
              rushing_touchdowns: rushing_touchdowns)
          end
        end


        if player.tight_end?
          game_log_rows.each do |row|
            cells = row.css("td")
            week = cells[0].text.to_i
            date = (cells[1].text + " #{year}").to_date
            if previous_date > date
              year = year + 1
              date = (cells[1].text + " #{year}").to_date
            end
            previous_date = date
            opponent = cells[2].text
            receptions = cells[3].text.to_i
            receiving_yards = cells[4].text.to_i
            receiving_touchdowns = cells[6].text.to_i
            rushing_attempts = cells[7].text.to_i
            rushing_yards = cells[8].text.to_i
            rushing_touchdowns= cells[10].text.to_i
            receiving_game_log = player.receiving_game_logs.find_or_initialize_by(week: week)
            receiving_game_log.update_attributes!(
              season: 2015, date: date, opponent: opponent, receptions: receptions, 
              receiving_yards: receiving_yards, receiving_touchdowns: receiving_touchdowns, 
              rushing_attempts: rushing_attempts, rushing_yards: rushing_yards, 
              rushing_touchdowns: rushing_touchdowns)
          end
        end
      end
    end
  end

  def self.extract_position(player_name)
    player_name.match(POSITION_PATTERN)[1]
  end
end