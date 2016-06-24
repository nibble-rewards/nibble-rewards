class CreateSquareIntegrations < ActiveRecord::Migration
  def change
    create_table :square_integrations do |t|
      t.string :application_id
      t.string :access_token
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
