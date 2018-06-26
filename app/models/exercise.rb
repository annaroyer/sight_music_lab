class Exercise < ApplicationRecord
  validates_presence_of :notes, :tse, :key
  has_many :attempts

  def self.random
    random_id = rand(1..count)
    find(random_id)
  end

  def single_beat
    "1" + tse[tse.index('/')..-1]
  end
end
