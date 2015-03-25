class LocationSerializer < ApplicationSerializer
	attributes :lat,:lng
	has_one :trap

	def trap
		object.locationable
	end
end