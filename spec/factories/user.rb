FactoryGirl.define do
    factory :user do
    sequence(:username, 100) { |n| "Sahil#{n}" }
    sequence(:email, 100) { |n| "person#{n}@example.com"}
    password "password"
    password_confirmation "password"
    confirmed_at Time.now
  end

 factory :admin, class: User do
    username "Admin"
    sequence(:email, 100) { |n| "admin#{n}@example.com"}
    password "password"
    password_confirmation "password"
    role "admin"
    confirmed_at Time.now
  end
end