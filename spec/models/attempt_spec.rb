require 'rails_helper'

describe Attempt, type: :model do
  context 'validations' do
    it { should validate_presence_of :song }
    it { should validate_presence_of :score }
  end

  context 'relationships' do
    it { should belong_to :user }
  end
end
