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


# Create Topics
Topic.create!(name: 'SLEEPERS', image_path: Faker::Avatar.image)
Topic.create!(name: 'DYNASTY', image_path: Faker::Avatar.image)
Topic.create!(name: 'INJURIES', image_path: Faker::Avatar.image)
Topic.create!(name: 'WAIVER WIRE', image_path: Faker::Avatar.image)
Topic.create!(name: 'START / SIT', image_path: Faker::Avatar.image)
Topic.create!(name: 'TRADE ADVICE', image_path: Faker::Avatar.image)
topics = Topic.all

# Create Posts
250.times do
  Post.create!(
    user:  users.sample,
    topic: topics.sample,
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph
  )
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
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
