class Attempt < ApplicationRecord
  belongs_to :user
  validates_presence_of :song

  serialize :song
end
