class Event < ActiveRecord::Base
	belongs_to :trap
	has_one :location, as: :locationable

	after_create :set_location
	after_create :send_notifications

	def send_notifications
		trap.notifications.each {|notification| notification.send_event(self)}
		trap.company.notifications.each {|notification| notification.send_event(self)}
	end

	def set_location
		loc = trap.location
		Location.create lat:loc.lat,lng:loc.lng,locationable_type:"Event",locationable_id:id
	end

end