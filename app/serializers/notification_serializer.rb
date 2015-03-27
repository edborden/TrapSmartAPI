class NotificationSerializer < ApplicationSerializer
	attributes :mode,:target
	has_one :company
	has_one :trap

	def company
		object.notifiable if object.notifiable.is_a? Company
	end

	def trap
		object.notifiable if object.notifiable.is_a? Trap
	end
end