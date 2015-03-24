class Offer < ActiveRecord::Base
	belongs_to 	:workitem, inverse_of:  :offers
	belongs_to  :user, inverse_of:  :offers
end
