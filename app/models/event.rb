class Event < ActiveRecord::Base
	belongs_to :trap
	has_one :location, as: :locationable

	after_create :send_notifications

	def send_notifications
		trap.notifications.each {|notification| notification.send_event(self)}
		company.notifications.each {|notification| notification.send_event(self)}
	end

end