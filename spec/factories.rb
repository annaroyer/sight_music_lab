FactoryBot.define do
  factory :user do
    sequence(:uid) { |n| n }
    first_name "Anna"
    last_name "Royer"
    email "anna.royer@colorado.edu"
    sequence(:token) { |n| "#{n}" }
    oauth_expires_at 123456
  end

  factory :attempt do
    user
    audio { File.new("#{Rails.root}/spec/fixtures/recorded.mp3", 'w') }
  end
end
