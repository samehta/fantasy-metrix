class Scraper

  def self.passing
    puts "Begin scraping passing game logs.."
    qb_urls = ['http://www.rotoworld.com/player/nfl/6491/cam-newton',
               'http://www.rotoworld.com/player/nfl/7460/russell-wilson',
               'http://www.rotoworld.com/player/nfl/1163/tom-brady',
               'http://www.rotoworld.com/player/nfl/2550/carson-palmer', 
               'http://www.rotoworld.com/player/nfl/9320/blake-bortles']

    # url = page.css('div[id=cp1_pnlDepthCharts] table a')[1]['href']

    qb_urls.each do |url|
      page = Nokogiri::HTML(open(url))
      player_name = page.css('div.playername').text.match(/(.+) \| (.+) \|/)[1]
      team_name = page.css('td:contains("Team:")').first.ancestors('tr').css('a').text
      position = page.css('div.playername').text.match(/\| (.+) \|/)[1]
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
          rushing_touchdowns: rushing_touchdowns)
      end
      p player.passing_game_logs
    end
  end


  def self.rushing 
    puts "Begin scraping rushing game logs.."
    rb_urls = ['http://www.rotoworld.com/player/nfl/4169/adrian-peterson',
               'http://www.rotoworld.com/player/nfl/9423/devonta-freeman',
               'http://www.rotoworld.com/player/nfl/7426/doug-martin',
               'http://www.rotoworld.com/player/nfl/4685/matt-forte',
               'http://www.rotoworld.com/player/nfl/6168/chris-ivory']

    rb_urls.each do |url|
      page = Nokogiri::HTML(open(url))
      player_name = page.css('div.playername').text.match(/(.+) \| (.+) \|/)[1]
      team_name = page.css('td:contains("Team:")').first.ancestors('tr').css('a').text
      position = page.css('div.playername').text.match(/\| (.+) \|/)[1]
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
        rushing_attempts = cells[3].text.to_i
        rushing_yards = cells[4].text.to_i
        rushing_touchdowns = cells[6].text.to_i
        receptions = cells[7].text.to_i
        receiving_yards = cells[8].text.to_i
        receiving_touchdowns= cells[10].text.to_i
        rushing_game_log = player.rushing_game_logs.find_or_initialize_by(week: week)
        rushing_game_log.update_attributes!(
          season: year, date: date, opponent: opponent, rushing_attempts: rushing_attempts,
          rushing_yards: rushing_yards, rushing_touchdowns: rushing_touchdowns, receptions: receptions, 
          receiving_yards: receiving_yards, receiving_touchdowns: receiving_touchdowns)
      end
      p player.rushing_game_logs
    end
  end


  def self.receiving
    puts "Begin scraping receiving game logs.."
    receiver_urls = ['http://www.rotoworld.com/player/nfl/6475/julio-jones',
                     'http://www.rotoworld.com/player/nfl/5698/antonio-brown',
                     'http://www.rotoworld.com/player/nfl/9403/odell-beckham',
                     'http://www.rotoworld.com/player/nfl/9297/allen-robinson',
                     'http://www.rotoworld.com/player/nfl/3653/brandon-marshall',
                     'http://www.rotoworld.com/player/nfl/5729/rob-gronkowski',
                     'http://www.rotoworld.com/player/nfl/4190/greg-olsen',
                     'http://www.rotoworld.com/player/nfl/8412/jordan-reed',
                     'http://www.rotoworld.com/player/nfl/3976/delanie-walker',
                     'http://www.rotoworld.com/player/nfl/8411/travis-kelce']

    receiver_urls.each do |url|
      page = Nokogiri::HTML(open(url))
      player_name = page.css('div.playername').text.match(/(.+) \| (.+) \|/)[1]
      team_name = page.css('td:contains("Team:")').first.ancestors('tr').css('a').text
      position = page.css('div.playername').text.match(/\| (.+) \|/)[1]
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
        receptions = cells[3].text.to_i
        receiving_yards = cells[4].text.to_i
        receiving_touchdowns = cells[6].text.to_i
        rushing_attempts = cells[7].text.to_i
        rushing_yards = cells[8].text.to_i
        rushing_touchdowns= cells[10].text.to_i
        receiving_game_log = player.receiving_game_logs.find_or_initialize_by(week: week)
        receiving_game_log.update_attributes!(
          season: year, date: date, opponent: opponent, receptions: receptions, 
          receiving_yards: receiving_yards, receiving_touchdowns: receiving_touchdowns, 
          rushing_attempts: rushing_attempts, rushing_yards: rushing_yards, 
          rushing_touchdowns: rushing_touchdowns)
      end
      p player.receiving_game_logs
    end
  end

end