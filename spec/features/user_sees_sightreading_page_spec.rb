require 'rails_helper'

describe 'As a user' do
  context 'when I visit /sight-read' do
    scenario 'I see a sightreading example' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/sight-read'

      expect(page).to have_css('.exercises')
      expect(page).to 
    end
  end
end
