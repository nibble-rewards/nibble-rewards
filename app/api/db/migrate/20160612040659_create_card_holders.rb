class CreateCardHolders < ActiveRecord::Migration
  def change
    create_table :card_holders do |t|
      t.integer :user_id
      t.integer :total_spent

      t.timestamps null: false
    end
  end
end
