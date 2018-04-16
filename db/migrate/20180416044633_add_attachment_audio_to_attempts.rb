class AddAttachmentAudioToAttempts < ActiveRecord::Migration[5.1]
  def self.up
    change_table :attempts do |t|
      t.attachment :audio
    end
  end

  def self.down
    remove_attachment :attempts, :audio
  end
end
