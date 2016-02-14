require 'faker'


# Create Users
8.times do
user = User.new(
  username: Faker::Name.name,
  email:    Faker::Internet.email,
  password: Faker::Lorem.characters(10)
)
user.skip_confirmation!
user.save!
end
users = User.all

# Create Admin User
admin = User.new(
  username: 'Admin',
  email:    'admin@example.com',
  password: 'password',
  role:     'admin'
)
admin.skip_confirmation!
admin.save!
 
# Create Standard User
standard = User.new(
  username: 'Sahil',
  email:    'samehta91@gmail.com',
  password: 'password'
)
standard.skip_confirmation!
standard.save!


# Create Articles
24.times do
  Article.create!(
    user: users.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraphs(30),
    image_path: Faker::Avatar.image
  )
end
articles = Article.all


# Create Teams
NflTeam.create!(name: 'Baltimore Ravens', image_path: 'baltimore_ravens/ravens.png')
NflTeam.create!(name: 'Cincinnati Bengals', image_path: 'cincinnati_bengals/bengals.png')
NflTeam.create!(name: 'Cleveland Browns', image_path: 'cleveland_browns/browns.png')
NflTeam.create!(name: 'Pittsburgh Steelers', image_path: 'pittsburgh_steelers/steelers.png')
NflTeam.create!(name: 'Chicago Bears', image_path: 'chicago_bears/bears.png')
NflTeam.create!(name: 'Detroit Lions', image_path: 'detroit_lions/lions.png')
NflTeam.create!(name: 'Green Bay Packers', image_path: 'green_bay_packers/packers.png')
NflTeam.create!(name: 'Minnesota Vikings', image_path: 'minnesota_vikings/vikings.png')
NflTeam.create!(name: 'Denver Broncos', image_path: 'denver_broncos/broncos.png')
NflTeam.create!(name: 'Kansas City Chiefs', image_path: 'kansas_city_chiefs/chiefs.png')
NflTeam.create!(name: 'San Diego Chargers', image_path: 'san_diego_chargers/chargers.png')
NflTeam.create!(name: 'Oakland Raiders', image_path: 'oakland_raiders/raiders.png')
NflTeam.create!(name: 'Arizona Cardinals', image_path: 'arizona_cardinals/cardinals.png')
NflTeam.create!(name: 'Los Angeles Rams', image_path: 'los_angeles_rams/rams.png')
NflTeam.create!(name: 'San Francisco 49ers', image_path: 'san_francisco_49ers/niners.png')
NflTeam.create!(name: 'Seattle Seahawks', image_path: 'seattle_seahawks/seahawks.png')
NflTeam.create!(name: 'Buffalo Bills', image_path: 'buffalo_bills/bills.png')
NflTeam.create!(name: 'Miami Dolphins', image_path: 'miami_dolphins/dolphins.png')
NflTeam.create!(name: 'New England Patriots', image_path: 'new_england_patriots/patriots.png')
NflTeam.create!(name: 'New York Jets', image_path: 'new_york_jets/jets.png')
NflTeam.create!(name: 'Dallas Cowboys', image_path: 'dallas_cowboys/cowboys.png')
NflTeam.create!(name: 'New York Giants', image_path: 'new_york_giants/giants.png')
NflTeam.create!(name: 'Philadelphia Eagles', image_path: 'philadelphia_eagles/eagles.png')
NflTeam.create!(name: 'Washington Redskins', image_path: 'washington_redskins/redskins.png')
NflTeam.create!(name: 'Houston Texans', image_path: 'houston_texans/texans.png')
NflTeam.create!(name: 'Indianapolis Colts', image_path: 'indianapolis_colts/colts.png')
NflTeam.create!(name: 'Jacksonville Jaguars', image_path: 'jacksonville_jaguars/jaguars.png')
NflTeam.create!(name: 'Tennessee Titans', image_path: 'tennessee_titans/titans.png')
NflTeam.create!(name: 'Atlanta Falcons', image_path: 'atlanta_falcons/falcons.png')
NflTeam.create!(name: 'Carolina Panthers', image_path: 'carolina_panthers/panthers.png')
NflTeam.create!(name: 'New Orleans Saints', image_path: 'new_orleans_saints/saints.png')
NflTeam.create!(name: 'Tampa Bay Buccaneers', image_path: 'tampa_bay_buccaneers/buccaneers.png')
teams = NflTeam.all


# Create Topics
Topic.create!(name: 'DEFENSES', image_path: Faker::Avatar.image)
Topic.create!(name: 'DYNASTY', image_path: Faker::Avatar.image)
Topic.create!(name: 'INJURIES', image_path: Faker::Avatar.image)
Topic.create!(name: 'WAIVER WIRE', image_path: Faker::Avatar.image)
Topic.create!(name: 'START / SIT', image_path: Faker::Avatar.image)
Topic.create!(name: 'TRADE ADVICE', image_path: Faker::Avatar.image)
topics = Topic.all

# Create Posts
250.times do
  post = Post.create!(
    user:  users.sample,
    topic: topics.sample,
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph
  )
  post.update_attributes!(created_at: rand(10.minutes .. 1.year).ago)
  post.update_rank
end
posts = Post.all
 
# Create Comments
1000.times do
  Comment.create!(
    post: posts.sample,
    user: users.sample,
    body: Faker::Lorem.paragraph
  )
end


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Article.count} articles created"
puts "#{NflTeam.count} teams created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"