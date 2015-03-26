class Texter
	require 'twilio-ruby'

	def initialize
		@sid = 'ACc5cec5af0742b5931507059ba95ec5f4'
		@auth = '3520dfee8a39c965794a49b55427f47a'		
	end

	def client
		@client ||= Twilio::REST::Client.new @sid,@auth
	end
	
	def trap_closed
		client.account.messages.create {
			body: "Trap Closed!",
			to: "+12012130688",
			from: "+19739754156"			
		}
	end

end