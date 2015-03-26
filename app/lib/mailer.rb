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

	def trap_closed
		return
	end

end