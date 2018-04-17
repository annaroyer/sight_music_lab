class Attempt < ApplicationRecord
  belongs_to :user
  belongs_to :exercise

  attr_accessor :audio_file_name
  has_attached_file :audio
  do_not_validate_attachment_file_type :audio,
  storage: :s3,
  s3_region: ENV.fetch('AWS_REGION'),
  s3_host_name: 's3-us-west-1.amazonaws.com',
  path: '/:class/:attachment/:id_partition/:style/:filename',
  s3_credentials: {
    bucket: ENV.fetch('S3_BUCKET_NAME'),
    access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
    secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY')
  }

  def song
    Song.from_upload(audio.url)
  end
end
