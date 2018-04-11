require 'rails_helper'

describe 'As a user' do
  context 'when I visit /sight-read' do
    before(:each) do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    scenario 'I see a sightreading example' do
      visit '/sight-read'

      expect(page).to have_css('#exercises')
      expect(page).to have_content('120 bpm')
    end
  end
end
