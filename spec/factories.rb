FactoryBot.define do
  factory :user do
    sequence(:uid) { |n| n }
    first_name "Anna"
    last_name "Royer"
    email "anna.royer@colorado.edu"
    sequence(:token) { |n| "#{n}" }
    oauth_expires_at 123456
  end

  factory :exercise do
    notes "z1 A^,2 D2 | F2 D2 A^,3"
    key 'A^ Maj'
    tse '4/4'
  end
end
