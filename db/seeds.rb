# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

statuses_list = [
  [ "Workitem", 'New' ],
  [ "Workitem", 'Posted' ],
  [ "Workitem", 'InWork' ],
  [ "Workitem", 'Done' ],
  [ "WorkitemOffer", 'New' ],
  [ "WorkitemOffer", 'Confirmed' ]

]

statuses_list.each do |statusable_type, name|
  status = Status.find_by(statusable_type: statusable_type, name: name)
  
  Status.create( statusable_type: statusable_type, name: name ) if status.nil?
  	
end
