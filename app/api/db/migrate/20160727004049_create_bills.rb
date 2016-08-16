class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :title
      t.text :description
      t.integer :day_of_the_month
      t.integer :balance
      t.string :url
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
