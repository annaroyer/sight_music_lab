FactoryBot.define do
  factory :user do
    sequence(:uid) { |n| "#{n}" }
    first_name "Anna"
    last_name "Royer"
    email "anna.royer@colorado.edu"
    sequence(:token) { |n| "#{n}" }
    oauth_expires_at 123456
  end
end
