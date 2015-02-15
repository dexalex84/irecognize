class AddDescriptionToWorkitem < ActiveRecord::Migration
  def change
    add_column :workitems, :description, :string
  end
end
