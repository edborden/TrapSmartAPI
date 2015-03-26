class Notification < ActiveRecord::Base
	belongs_to :notifiable, polymorphic: true

	def send event
		return
	end
end