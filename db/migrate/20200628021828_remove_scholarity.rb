class RemoveScholarity < ActiveRecord::Migration[6.0]
  def change
    remove_column :characters, :scholarity
  end
end
