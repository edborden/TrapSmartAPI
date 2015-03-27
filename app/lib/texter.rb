class Texter
	require 'twilio-ruby'

	def initialize target
		@sid = 'ACc5cec5af0742b5931507059ba95ec5f4'
		@auth = '3520dfee8a39c965794a49b55427f47a'
		@target = target	
	end

	def client
		@client ||= Twilio::REST::Client.new @sid,@auth
	end
	
	def trap_closed event
		client.account.messages.create body: "#{event.trap.name} Closed at google.com/maps/?q=#{event.location.lat},#{event.location.lng}",		
			to: @target,
			from: "+19739754156"			
	end

end