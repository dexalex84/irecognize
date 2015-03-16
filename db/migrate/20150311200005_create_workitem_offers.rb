class CreateWorkitemOffers < ActiveRecord::Migration
  def change
    create_table :workitem_offers do |t|
      t.integer :user_id
      t.integer :workitem_id

      t.timestamps null: false
    end
  end
end
