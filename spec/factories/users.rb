FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    email 'test@example.com'
    password 'password'
    password_confirmation 'password'
  end
end
