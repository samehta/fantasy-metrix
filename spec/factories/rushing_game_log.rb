FactoryGirl.define do
  factory :rushing_game_log do
    sequence(:rushing_attempts, (10..30).cycle) { |n| n }
    sequence(:rushing_yards, (50..150).cycle) { |n| n }
  end
end