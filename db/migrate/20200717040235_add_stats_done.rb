class AddStatsDone < ActiveRecord::Migration[6.0]
  def change
    add_column :stats, :done, :boolean
  end
end
