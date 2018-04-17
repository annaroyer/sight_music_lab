class Exercise < ApplicationRecord
  validates_presence_of :notes, :tse, :key
  has_many :attempts

  def self.random
    offset = rand(count)
    Exercise.offset(offset).first
  end
end
