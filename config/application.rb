require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TrapSmartApi
  class Application < Rails::Application

        ActiveModel::Serializer.setup do |config|
            config.embed = :ids
            #config.embed_in_root = false
        end

        config.middleware.insert_before 0, "Rack::Cors" do
            allow do
                origins '*'
                resource '*', :headers => :any, :methods => [:get, :post, :put, :patch, :options, :delete]
            end
        end
        
        #MandrillMailer.configure do |config|
        #    config.api_key = "05AGnHwxdAK5OVfFd6Ev_g"
        #end

  end
end