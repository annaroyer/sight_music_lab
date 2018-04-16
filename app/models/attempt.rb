class Attempt < ApplicationRecord
  belongs_to :user

  serialize :song
end
