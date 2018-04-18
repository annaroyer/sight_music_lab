class AddSongToAttempt < ActiveRecord::Migration[5.1]
  def change
    add_column :attempts, :song, :text
  end
end
