class WorkitemOffer < ActiveRecord::Base
	belongs_to 	:user
	has_one 	:workitem, inverse_of: :workitem_offer
	has_one     :status, as:  :statusable

end
