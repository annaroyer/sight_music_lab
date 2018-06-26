require 'rails_helper'

describe 'As a visitor' do
  context 'when I visit / and click get started' do
    scenario 'I can start an account using google' do
      create(:exercise)
      
      stub_omniauth

      visit root_path

      click_button 'Get Started'

      expect(current_path).to eq('/sight-read')
      expect(page).to have_content('Welcome, Anna')
    end
  end
end

describe 'As a user' do
  context 'when I visit / and click login' do
    scenario 'I can login using google' do
      create(:exercise)

      stub_omniauth

      visit root_path

      click_button 'Log In'

      expect(current_path).to eq('/sight-read')
      expect(page).to have_content('Welcome, Anna')
    end
  end

  context 'when I am logged in and click on log out' do
    scenario 'I am no longer logged in' do
      create(:exercise)

      stub_omniauth

      visit root_path

      click_button 'Log In'

      within('#menu') { click_button 'Log Out' }

      expect(current_path).to eq(root_path)
      expect(page).to have_button('Log In')
    end
  end
end


def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
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
    })
end
