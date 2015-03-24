class AddFieldsToOffer < ActiveRecord::Migration
  def change
  		add_column :offers, :price, :float
  		add_column :offers, :time, :float
  		add_column :offers, :status_id, :integer
  		add_column :offers, :currency_id, :integer
  end
end
