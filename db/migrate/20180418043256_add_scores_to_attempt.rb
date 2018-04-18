class AddScoresToAttempt < ActiveRecord::Migration[5.1]
  def change
    add_column :attempts, :pitch_score, :integer
    add_column :attempts, :rhythm_score, :integer
  end
end
