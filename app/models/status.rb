class Status < ActiveRecord::Base
	belongs_to :statusable, polymorphic: true
end
