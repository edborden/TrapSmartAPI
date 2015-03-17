class MessageController < ActionController::API
	include ActionController::HttpAuthentication::Basic::ControllerMethods

	http_basic_authenticate_with name: "1faafdceeba45ad26f97a061b", password: "afbc67f939eea5b3f5753dba7c5fe"

	def create
		puts params
		head :no_content
	end

end