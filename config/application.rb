require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TrapSmartApi
	class Application < Rails::Application

		config.middleware.insert_before 0, "Rack::Cors" do
			allow do
				origins '*'
				resource '*', :headers => :any, :methods => [:get, :post, :put, :patch, :options, :delete]
			end
		end

		MandrillMailer.configure do |config|
			config.api_key = "iJU6wEsSVJ8am5P4vyywcg"
		end

	end
end
