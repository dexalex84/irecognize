class CommonHelpers

	def get_wi_published
		Status.wi_published.first.statusable_id
	end

	def get_wi_new
		Status.wi_new.first.statusable_id
	end


end
