class AddExerciseToAttempt < ActiveRecord::Migration[5.1]
  def change
    add_reference :attempts, :exercise, foreign_key: true
  end
end
