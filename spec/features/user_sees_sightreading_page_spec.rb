require 'rails_helper'

describe 'As a user' do
  context 'when I visit /sight-read' do
    before(:each) do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    scenario 'I see a sightreading example' do
      exercise = create(:exercise)

      visit '/sight-read'

      expect(page).to have_css('input')
      expect(page).to have_css('audio')
      expect(page).to have_css('.stop')
      expect(page).to have_css('.start')
      expect(page).to have_css('.exercise')
      expect(page).to have_css("##{exercise.id}")

      within("##{exercise.id}") do
        expect(page).to have_content(exercise.notes)
        expect(page).to have_content("M: #{exercise.tse}")
        expect(page).to have_content("L: #{exercise.single_beat}")
        expect(page).to have_content("K: #{exercise.key}")
        expect(page).to have_content("#{exercise.notes}")
      end
    end
  end

  scenario 'I see a different sightreading example' do
    exercise = create(:exercise, key: 'C min', tse: '3/4', notes: "C1 E2 C1 | c2 b1 c1|]")

    visit '/sight-read'

    within("##{exercise.id}") do
      expect(page).to have_content(exercise.notes)
      expect(page).to have_content("M: #{exercise.tse}")
      expect(page).to have_content("L: #{exercise.single_beat}")
      expect(page).to have_content("K: #{exercise.key}")
      expect(page).to have_content("#{exercise.notes}")
    end
  end
end
