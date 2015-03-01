# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

statuses_list = [
  [1, "Workitem", 'New' ],
  [2, "Workitem", 'Published' ],
  [3, "Workitem", 'InWork' ],
  [4, "Workitem", 'Done' ],
  [5, "WorkitemOffer", 'New' ],
  [6, "WorkitemOffer", 'Confirmed' ]

]


statuses_list.each do |statusable_id, statusable_type, name|
  status = Status.find_by(statusable_id: statusable_id)
  
  if status.nil?
  	Status.create(statusable_id: statusable_id, statusable_type: statusable_type, name: name ) 
  else
  	if status.statusable_type!=statusable_type || status.name!=name
  		status.statusable_type = statusable_type
  		status.name = name
  		status.save
  	end
  end	
end


