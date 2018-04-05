class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :uid, index: true
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :token
      t.integer :oauth_expires_at
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
