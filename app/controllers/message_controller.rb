class MessageController < ActionController::API
	include ActionController::HttpAuthentication::Basic::ControllerMethods

	http_basic_authenticate_with name: "1faafdceeba45ad26f97a061b", password: "afbc67f939eea5b3f5753dba7c5fe"

	def create

		event_code = params[:data][:event_code].to_i
		hardware_id = params[:data][:device_name]
		latitude = params[:data][:gps_latitude]
		longitude = params[:data][:gps_longitude]

		MessageConverter.new event_code,hardware_id,latitude,longitude
		
		head :no_content
	end

end