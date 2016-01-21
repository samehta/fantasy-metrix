FactoryGirl.define do
  factory :passing_game_log do
    sequence(:completions, (20..30).cycle) { |n| n }
    sequence(:passing_attempts, (40..60).cycle) { |n| n }
    sequence(:passing_yards, (200..400).cycle) { |n| n }
  end
end