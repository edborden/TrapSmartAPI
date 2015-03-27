class Notification < ActiveRecord::Base
	belongs_to :notifiable, polymorphic: true
	before_create :save_normalized_phone_number, if: :text_notification?

	def send_event event
		if text_notification?
			Texter.new(normalized_phone_number).trap_closed(event)
		else
			Mailer.new.trap_closed event,target
		end
	end

	def save_normalized_phone_number
		normalized_phone_number = PhonyRails.normalize_number(target, :country_code => 'US')
		self.normalized_phone_number = normalized_phone_number
	end

	def text_notification?
		mode == "Text"
	end
end