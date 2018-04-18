class DeleteAudioFromAttempt < ActiveRecord::Migration[5.1]
  def change
    remove_column :attempts, :audio_file_name, :string
    remove_column :attempts, :audio_content_type, :string
    remove_column :attempts, :audio_file_size, :string
    remove_column :attempts, :audio_updated_at, :datetime
  end
end
