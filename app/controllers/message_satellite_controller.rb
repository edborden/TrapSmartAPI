class MessageSatelliteController < ActionController::API
	include ActionController::HttpAuthentication::Basic::ControllerMethods

	http_basic_authenticate_with name: "39eea5b3f5753dad26f97a061b", password: "afbc67f9ba7c5fe45ad26f97a061b"

	def create
		request_hash = Hash.from_xml(request.body.read)["trackermessages"]["trackermessage"]
		
		event_code = "tbd"
		hardware_id = request_hash["asset"]["esn"]
		latitude = request_hash["position"]["coordinate"]["latitude"]
		longitude = request_hash["position"]["coordinate"]["longitude"]


		MessageConverter.new event_code,hardware_id,latitude,longitude
		
		head :no_content
	end

end