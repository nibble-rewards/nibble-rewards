class AddSquareIntegrationIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :square_integration_id, :integer
  end
end
