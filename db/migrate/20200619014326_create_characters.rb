class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.belongs_to :user

      t.string :name
      t.string :ocupation
      t.string :scholarity
      t.string :birth_place
      t.integer :age
      t.text :mental_illnesses
      t.string :sex

      t.timestamps
    end
  end
end
