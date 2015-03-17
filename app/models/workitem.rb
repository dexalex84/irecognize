class Workitem < ActiveRecord::Base
	belongs_to 	:user
	has_one    	:status, as:  :statusable
	has_many	:offers, inverse_of:  :workitem

end
