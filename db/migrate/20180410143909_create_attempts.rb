class CreateAttempts < ActiveRecord::Migration[5.1]
  def change
    create_table :attempts do |t|
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
