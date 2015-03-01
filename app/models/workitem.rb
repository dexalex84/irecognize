class Workitem < ActiveRecord::Base
	belongs_to :user
	has_one    :status, as:  :statusable
end
