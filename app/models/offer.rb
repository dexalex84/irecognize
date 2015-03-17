class Offer < ActiveRecord::Base
	belongs_to 	:workitem, inverse_of:  :offer
end
