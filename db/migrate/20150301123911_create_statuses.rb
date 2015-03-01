class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :statusable_type
      t.integer :statusable_id
      t.string :name

      t.timestamps null: false
    end
  end
end
