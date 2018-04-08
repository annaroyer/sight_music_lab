require 'rails_helper'

describe User, type: :model do
  it 'creates or updates itself from an oauth hash' do
    auth = {
      provider: "google",
      uid: "12345",
      info: {
        name: "Anna Royer",
        email: "anro0672@colorado.edu",
        first_name: "Anna",
        last_name: "Royer"
      },
      credentials: {
        token: "Iamatoken",
        expires_at: 1522968194,
        expires: true
      }
    }
    User.update_or_create(auth)
    new_user = User.first

    expect(new_user.uid).to eq("12345")
    expect(new_user.email).to eq("anro0672@colorado.edu")
    expect(new_user.first_name).to eq("Anna")
    expect(new_user.last_name).to eq("Royer")
    expect(new_user.oauth_expires_at).to eq(auth[:credentials][:expires_at])
  end
end
