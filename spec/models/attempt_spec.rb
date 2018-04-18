require 'rails_helper'

describe Attempt, type: :model do
  context 'relationships' do
    it { should belong_to :user }
    it { should belong_to :exercise }
  end

  context 'validations' do
    it { should validate_presence_of :song }
    it { should validate_presence_of :pitch_score }
    it { should validate_presence_of :rhythm_score }
  end
end
