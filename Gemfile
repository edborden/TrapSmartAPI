source 'https://rubygems.org'

gem 'rails', '4.1.9'
gem 'rails-api',"0.4.0"
gem 'active_model_serializers',"0.8.3"
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]
gem 'pg'
gem 'rack-cors', require: 'rack/cors'
gem 'bcrypt', platforms: :ruby

## ANALYTICS
gem 'keen', '0.8.9'

## EMAIL
gem 'mandrill_mailer', '0.5.1'
gem 'mailchimp-api', require: 'mailchimp'

## SMS
gem 'phony_rails', '0.12.0' # phone number normalization
gem 'twilio-ruby', '3.15.2'

# SHOULD GO IN TEST, TMP FOR DEMO
gem 'fabrication', '2.12.2'
gem "faker", '1.4.3'

group :test do
	gem 'mocha', "~> 1.0.0"

end

group :production do
	gem 'rails_12factor'
	gem 'newrelic_rpm'
	gem 'unicorn', platforms: :ruby
end