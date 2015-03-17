class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :workitem_id
      t.string :description

      t.timestamps null: false
    end
  end
end
