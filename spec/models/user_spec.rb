require 'rails_helper'

describe User, type: :model do
  it 'creates or updates itself from an oauth hash' do
    auth = {
      provider: "google",
      uid: "104267037309165833746",
      info: {
        name: "Anna Royer",
        email: "anro0672@colorado.edu",
        first_name: "Anna",
        last_name: "Royer"
      },
      credentials: {
        token: "ya29.GluUBTfiZVBGSyQoN6NarV53y8jFL47tyksZOMJ-2lcLDX2XbugaZGEZhnCrpHehwOijeM0VjpWZ1AZQLBbchkp6ErtR36esgmh71i5KZRR4etR2d3b74VZS6H34",
        expires_at: 1522968194,
        expires: true
      }
    }
    User.update_or_create(auth)
    new_user = User.first

    expect(new_user.uid).to eq("104267037309165833746")
    expect(new_user.email).to eq("anro0672@colorado.edu")
    expect(new_user.first_name).to eq("Anna")
    expect(new_user.last_name).to eq("Royer")
    expect(new_user.oauth_expires_at).to eq(auth[:credentials][:expires_at])
  end
end
