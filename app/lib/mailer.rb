class Mailer < MandrillMailer::TemplateMailer
	default from: "notifications@trapsmart.com"
	default from_name: "TrapSmart"

	def welcome user, password
		mandrill_mail( template: 'welcome',
			subject: "Your TrapSmart.com account",
			to: {email: user.email, name: user.name},
			important: true,
			inline_css: true,
			vars: {'PASSWORD' => password,'USERNAME' => user.email},
			async: true
		).deliver
	end

	def event event,target
		mandrill_mail( template: 'event',
			subject: "#{event.trap.name} reported #{event.name}",
			to: {email: target},
			important: true,
			inline_css: true,
			vars: {'TRAP_NAME' => event.trap.name,'LAT' => event.location.lat,'LNG' => event.location.lng,'EVENT_NAME'=> event.name},
			async: true
		).deliver		
	end

	def contact_form params
		mandrill_mail( template: 'contact_form',
			subject: "Contact Form Submission",
			to: {email: "info@trapsmart.com"},
			important: true,
			inline_css: true,
			vars: {'NAME' => params[:name],'EMAIL' => params[:email],'PHONE' => params[:phone],'COMPANY' => params[:company],'MESSAGE' => params[:message]},
			async: true
		).deliver			
	end

end