class NotificationSerializer < ApplicationSerializer
	attributes :mode,:target
	has_one :company, embed: :ids, include: false
	has_one :trap, embed: :ids, include: false

	def company
		object.notifiable if object.notifiable.is_a? Company
	end

	def trap
		object.notifiable if object.notifiable.is_a? Trap
	end
end