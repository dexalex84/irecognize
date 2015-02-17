class AddUserToWorkitem < ActiveRecord::Migration
  def change
    add_column :workitems, :user_id, :integer
  end
end
