class Offer < ActiveRecord::Base
	belongs_to 	:workitem, inverse_of:  :offers
end
