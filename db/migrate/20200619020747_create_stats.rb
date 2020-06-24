class CreateStats < ActiveRecord::Migration[6.0]
  def change
    create_table :stats do |t|
      t.belongs_to :character

      t.integer :str
      t.integer :dex
      t.integer :int
      t.integer :con
      t.integer :app
      t.integer :pow
      t.integer :siz
      t.integer :edu
      t.integer :luc
      t.integer :mov
      t.string :bon
      t.integer :lvl

      t.timestamps
    end
  end
end
