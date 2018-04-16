class Attempt < ApplicationRecord
  belongs_to :user

  def song
    Song.from_upload(audio)
  end

  attr_accessor :audio_file_name
  has_attached_file :audio
  do_not_validate_attachment_file_type :audio,
  storage: :s3,
    s3_credentials: {
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    },
      bucket: ENV['S3_BUCKET_NAME']
end
