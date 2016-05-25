class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.integer :user_id
      t.integer :star_amount
      t.integer :mimimum_purchase
      t.string :item_name
      t.integer :item_value

      t.timestamps null: false
    end
  end
end
