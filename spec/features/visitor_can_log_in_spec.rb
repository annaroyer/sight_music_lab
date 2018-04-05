require 'rails_helper'

describe 'As a visitor' do
  context 'when I visit / and click get started' do
    scenario 'I can create an account through google' do
      visit root_path

      click_on 'Get Started'
    end
  end
end
