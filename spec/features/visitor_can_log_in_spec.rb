require 'rails_helper'

describe 'As a user' do
  context 'when I visit / and click login' do
    scenario 'I can login using google' do
      stub_omniauth

      visit root_path

      click_button 'Log In'

      expect(current_path).to eq('/dashboard')
    end
  end
end


def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
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
    })
end
