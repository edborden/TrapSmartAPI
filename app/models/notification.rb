class Notification < ActiveRecord::Base
	belongs_to :notifiable, polymorphic: true
	before_create :save_normalized_phone_number,
		if: Proc.new { |notification| notification.mode == "Text" }

	def send_event event
		return
	end

	def save_normalized_phone_number
		normalized_phone_number = PhonyRails.normalize_number(target, :country_code => 'US')
		self.normalized_phone_number = normalized_phone_number
	end
end