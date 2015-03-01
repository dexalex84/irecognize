class AddStatusToWorkitem < ActiveRecord::Migration
  def change
    add_column :workitems, :status_id, :integer
  end
end
