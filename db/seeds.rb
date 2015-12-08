require 'faker'


# Create Users
10.times do
user = User.new(
  username: Faker::Name.name,
  email: Faker::Internet.email,
  password: Faker::Lorem.characters(10)
)
user.skip_confirmation!
user.save!
end
users = User.all

#Create Admin User
admin = User.new(
  username: 'Admin',
  email:    'admin@example.com',
  password: 'helloworld'
 )
 admin.skip_confirmation!
 admin.save!
 
 #Create Standard User
 standard = User.new(
  username: 'Sahil',
  email:    'samehta91@gmail.com',
  password: 'helloworld'
 )
 standard.skip_confirmation!
 standard.save!


# Create Posts
 50.times do
   Post.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 posts = Post.all
 
 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end


puts "Seed finished"
puts "#{User.count} users counted"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
