require 'rails_helper'

describe Exercise do
  context 'validations' do
    it { should validate_presence_of :notes }
    it { should validate_presence_of :tse }
    it { should validate_presence_of :key }
  end

  context 'relationships' do
    it { should have_many :attempts }
  end

  context 'class methods' do
    it 'returns a random exercise' do
      exercise = create(:exercise)

      expect(Exercise.random).to eq(exercise)
    end
  end
end
