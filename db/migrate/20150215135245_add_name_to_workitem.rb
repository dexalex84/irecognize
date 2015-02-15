class AddNameToWorkitem < ActiveRecord::Migration
  def change
    add_column :workitems, :name, :string
  end
end
