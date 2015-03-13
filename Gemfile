source 'https://rubygems.org'


gem 'rails', '4.1.8'
gem 'rails-api',"0.4.0"
gem 'active_model_serializers', git: "https://github.com/rails-api/active_model_serializers.git", ref: 'b9d216d'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]
gem 'pg'
gem 'rack-cors', require: 'rack/cors'

## ANALYTICS
gem 'keen'

## EMAIL
gem 'mandrill_mailer'
gem 'mailchimp-api', require: 'mailchimp'

group :test do
	gem 'mocha', "~> 1.0.0"
	gem 'fabrication'
	gem "faker"
end

group :production do
	gem 'rails_12factor'
	#gem 'newrelic_rpm'
	gem 'unicorn', platforms: :ruby
end