class Attempt < ApplicationRecord
  belongs_to :user

  def song
    Song.from_upload(audio)
  end

  attr_accessor :audio_file_name
  has_attached_file :audio
  do_not_validate_attachment_file_type :audio
end
