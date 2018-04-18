class Attempt < ApplicationRecord
  belongs_to :user
  belongs_to :exercise
  validates_presence_of :song, :pitch_score, :rhythm_score

  serialize :song
end
