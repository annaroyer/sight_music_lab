class CreateExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :exercises do |t|
      t.text :notes
      t.string :key
      t.string :tse

      t.timestamps
    end
  end
end
