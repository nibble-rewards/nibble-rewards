class AddActiveToBills < ActiveRecord::Migration
  def change
    add_column :bills, :active, :boolean
  end
end
