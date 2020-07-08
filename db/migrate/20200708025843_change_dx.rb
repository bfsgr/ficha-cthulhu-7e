class ChangeDx < ActiveRecord::Migration[6.0]
  def change
    change_column :stats, :dx, :string
  end
end
