class WorkitemOffer < ActiveRecord::Base
	belongs_to 	:user
	belongs_to 	:workitem, inverse_of: :workitem_offers
	has_one     :status, as:  :statusable

end
