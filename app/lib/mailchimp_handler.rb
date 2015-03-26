class MailchimpHandler

	def client
		@client ||= Mailchimp::API.new "ad001f99921219b729144ba6bc8bc964-us10"
	end

	def subscribe user
		if Rails.env == 'production'
			client.lists.subscribe "d29f01ab45", {email:user.email}, {name:user.name}, 'html', false
		end
	end

end