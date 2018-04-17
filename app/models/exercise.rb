class Exercise < ApplicationRecord
  validates_presence_of :notes, :tse, :key

  def self.random
    offset = rand(count)
    Exercise.offset(offset).first
  end
end
