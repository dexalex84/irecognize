class Workitem < ActiveRecord::Base
	belongs_to :user
	has_one    :status, as:  :statusable

	scope :published, -> { where( status: "Published" ) }
end
