class Status < ActiveRecord::Base
	belongs_to :statusable, polymorphic: true

	#default_scope { where statusable_type: 'Workitem' }
  
    scope :wi_new, -> { where statusable_type: 'Workitem', name: 'New' }
    scope :wi_published, -> { where statusable_type: 'Workitem', name: 'Published' }
    scope :wi_inwork, -> { where statusable_type: 'Workitem', name: 'InWork' } 
    scope :wi_done, -> { where  statusable_type: 'Workitem', name: 'Done' }
    scope :wo_new, -> { where statusable_type: 'WorkitemOffer', name: 'New' }
    scope :wo_confirmed, -> { where statusable_type: 'WorkitemOffer', name: 'Confirmed' }

end
