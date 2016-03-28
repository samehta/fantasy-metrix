# Create Admin User
admin = User.new(
  username: 'Randall Cobblepot',
  email:    'samehta91@gmail.com',
  password: 'selfmade',
  role:     'admin'
)
admin.skip_confirmation!
admin.save!


# Create Teams
NflTeam.create!(name: 'Baltimore Ravens', abbreviation: "BAL", image_path: 'nfl_teams/ravens.png')
NflTeam.create!(name: 'Cincinnati Bengals', abbreviation: "CIN", image_path: 'nfl_teams/bengals.png')
NflTeam.create!(name: 'Cleveland Browns', abbreviation: "CLE", image_path: 'nfl_teams/browns.png')
NflTeam.create!(name: 'Pittsburgh Steelers', abbreviation: "PIT", image_path: 'nfl_teams/steelers.png')
NflTeam.create!(name: 'Chicago Bears', abbreviation: "CHI", image_path: 'nfl_teams/bears.png')
NflTeam.create!(name: 'Detroit Lions', abbreviation: "DET", image_path: 'nfl_teams/lions.png')
NflTeam.create!(name: 'Green Bay Packers', abbreviation: "GB", image_path: 'nfl_teams/packers.png')
NflTeam.create!(name: 'Minnesota Vikings', abbreviation: "MIN", image_path: 'nfl_teams/vikings.png')
NflTeam.create!(name: 'Denver Broncos', abbreviation: "DEN", image_path: 'nfl_teams/broncos.png')
NflTeam.create!(name: 'Kansas City Chiefs', abbreviation: "KC", image_path: 'nfl_teams/chiefs.png')
NflTeam.create!(name: 'San Diego Chargers', abbreviation: "SD", image_path: 'nfl_teams/chargers.png')
NflTeam.create!(name: 'Oakland Raiders', abbreviation: "OAK", image_path: 'nfl_teams/raiders.png')
NflTeam.create!(name: 'Arizona Cardinals', abbreviation: "ARZ", image_path: 'nfl_teams/cardinals.png')
NflTeam.create!(name: 'Los Angeles Rams', abbreviation: "LAR", image_path: 'nfl_teams/rams.png')
NflTeam.create!(name: 'San Francisco 49ers', abbreviation: "SF", image_path: 'nfl_teams/niners.png')
NflTeam.create!(name: 'Seattle Seahawks', abbreviation: "SEA", image_path: 'nfl_teams/seahawks.png')
NflTeam.create!(name: 'Buffalo Bills', abbreviation: "BUF", image_path: 'nfl_teams/bills.png')
NflTeam.create!(name: 'Miami Dolphins', abbreviation: "MIA", image_path: 'nfl_teams/dolphins.png')
NflTeam.create!(name: 'New England Patriots', abbreviation: "NE", image_path: 'nfl_teams/patriots.png')
NflTeam.create!(name: 'New York Jets', abbreviation: "NYJ", image_path: 'nfl_teams/jets.png')
NflTeam.create!(name: 'Dallas Cowboys', abbreviation: "DAL", image_path: 'nfl_teams/cowboys.png')
NflTeam.create!(name: 'New York Giants', abbreviation: "NYG", image_path: 'nfl_teams/giants.png')
NflTeam.create!(name: 'Philadelphia Eagles', abbreviation: "PHI", image_path: 'nfl_teams/eagles.png')
NflTeam.create!(name: 'Washington Redskins', abbreviation: "WAS", image_path: 'nfl_teams/redskins.png')
NflTeam.create!(name: 'Houston Texans', abbreviation: "HOU", image_path: 'nfl_teams/texans.png')
NflTeam.create!(name: 'Indianapolis Colts', abbreviation: "IND", image_path: 'nfl_teams/colts.png')
NflTeam.create!(name: 'Jacksonville Jaguars', abbreviation: "JAC", image_path: 'nfl_teams/jaguars.png')
NflTeam.create!(name: 'Tennessee Titans', abbreviation: "TEN", image_path: 'nfl_teams/titans.png')
NflTeam.create!(name: 'Atlanta Falcons', abbreviation: "ATL", image_path: 'nfl_teams/falcons.png')
NflTeam.create!(name: 'Carolina Panthers', abbreviation: "CAR", image_path: 'nfl_teams/panthers.png')
NflTeam.create!(name: 'New Orleans Saints', abbreviation: "NO", image_path: 'nfl_teams/saints.png')
NflTeam.create!(name: 'Tampa Bay Buccaneers', abbreviation: "TB", image_path: 'nfl_teams/buccaneers.png')
teams = NflTeam.all


# Create Topics
Topic.create!(name: 'DEFENSES', image_path: 'backgrounds/defenses.png')
Topic.create!(name: 'DYNASTY', image_path: 'backgrounds/dynasty.png')
Topic.create!(name: 'INJURIES', image_path: 'backgrounds/injuries.png')
Topic.create!(name: 'WAIVER WIRE', image_path: 'backgrounds/waiver-wire.png')
Topic.create!(name: 'START / SIT', image_path: 'backgrounds/start-sit.png')
Topic.create!(name: 'TRADE ADVICE', image_path: 'backgrounds/trade-advice.png')
topics = Topic.all


puts "Production Seed finished"
puts "#{User.count} users created"
puts "#{NflTeam.count} teams created"
puts "#{Topic.count} topics created"