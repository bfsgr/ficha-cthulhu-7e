class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.belongs_to :character

      t.string :name
      t.integer :base
      t.integer :value
      t.boolean :sucess

      t.timestamps
    end
  end
end
