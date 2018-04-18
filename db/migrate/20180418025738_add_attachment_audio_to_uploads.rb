class AddAttachmentAudioToUploads < ActiveRecord::Migration[5.1]
  def self.up
    change_table :uploads do |t|
      t.attachment :audio
    end
  end

  def self.down
    remove_attachment :uploads, :audio
  end
end
