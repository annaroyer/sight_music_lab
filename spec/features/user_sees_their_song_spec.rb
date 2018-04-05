require 'rails_helper'

describe 'As a user' do
  context 'when I upload audio and click generate' do
    scenario 'I am on a song show page and I can see that song' do
      visit songs_path

      within('.vex-tabdiv') do
        expect(page).to have_content('key=Gm time=4/4')
        expect(page).to have_content('notes  C-D-E/4 F#/5 | G-A-B/4 F#/5')
      end
    end
  end
end
