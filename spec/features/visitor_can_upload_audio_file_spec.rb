require 'rails_helper'

describe 'As a visitor' do
  context 'When I visit the home page and I upload an audio file' do
    it 'I can create a new track' do
      visit root_path

      attach_file('Audio', Rails.root + 'spec/fixtures/testvoice.wav')
      click_on 'Upload'

      expect(page).to have_css('.sheet-music')
    end
  end
end
