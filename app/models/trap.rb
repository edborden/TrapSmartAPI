class Trap < ActiveRecord::Base
	validates :hardware_id, uniqueness: true
	validates :hardware_id, presence: true
	belongs_to :company
	has_one :location, as: :locationable, dependent: :destroy
	has_many :events, before_add: :set_event_location
	has_many :notifications, as: :notifiable, dependent: :destroy

	def set_location lat,lng

		location = self.location
		unless location
			location = Location.create
			self.location = location
		end
		location.lat = lat
		location.lng = lng
		location.save	
	end

	def too_soon_to_update
		min_time = Time.now - 3.minutes
		status_updated > min_time
	end

end