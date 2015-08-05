source 'https://rubygems.org'

gem 'rails', '4.1.9'
gem 'rails-api',"0.4.0"
gem 'active_model_serializers',"0.8.3"
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]
gem 'pg'
gem 'rack-cors', require: 'rack/cors'
gem 'bcrypt'

## ANALYTICS
gem 'keen'

## EMAIL
gem 'mandrill_mailer'
gem 'mailchimp-api', require: 'mailchimp'

## SMS
gem 'phony_rails' # phone number normalization
gem 'twilio-ruby'

# SHOULD GO IN TEST, TMP FOR DEMO
gem 'fabrication'
gem "faker"

group :test do
	gem 'mocha', "~> 1.0.0"

end

group :production do
	gem 'rails_12factor'
	gem 'newrelic_rpm'
	gem 'unicorn', platforms: :ruby
end