class CreateAttempts < ActiveRecord::Migration[5.1]
  def change
    create_table :attempts do |t|
      t.references :user, foreign_key: true
      t.integer :score
      t.text :song

      t.timestamps
    end
  end
end
