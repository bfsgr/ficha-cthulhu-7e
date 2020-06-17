class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username 
      t.string :invite
      t.string :e_password 
      t.string :salt
      t.boolean :is_dm
      t.timestamps
    end
  end
end
