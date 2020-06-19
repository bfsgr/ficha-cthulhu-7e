class CreateCurrentStats < ActiveRecord::Migration[6.0]
  def change
    create_table :current_stats do |t|
      t.belongs_to :character

      t.integer :max_life
      t.integer :life

      t.integer :max_san
      t.integer :san
      
      t.integer :max_mag
      t.integer :mag
      
      t.integer :armour

      t.boolean :dying
      t.boolean :insan_temp
      t.boolean :insan_indef
      
      t.boolean :dead_insan

      t.timestamps
    end
  end
end
