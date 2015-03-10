class RemoveStatusFromWorkitem < ActiveRecord::Migration
  def change
    remove_column :workitems, :status_id, :integer
  end
end
