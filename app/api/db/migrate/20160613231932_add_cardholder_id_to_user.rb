class AddCardholderIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :cardholder_id, :integer
  end
end
