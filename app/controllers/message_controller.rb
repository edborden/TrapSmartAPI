class MessageController < ActionController::API
	include ActionController::HttpAuthentication::Basic::ControllerMethods

	http_basic_authenticate_with name: "1faafdceeba45ad26f97a061b", password: "afbc67f939eea5b3f5753dba7c5fe"

	def create
		trap = Trap.find_by hardware_id: params[:data][:device_name]
		if trap

			## location
			location = trap.location
			unless location
				location = Location.create
				trap.location = location
			end
			location.lat = params[:data][:gps_latitude]
			location.lng = params[:data][:gps_longitude]
			location.save

			## event
			event = Event.new trap_id:trap.id
			case params[:data][:event_code].to_int
			when 110
				event.name = "Trap closed"
			when 109
				event.name = "Sensor unit battery low"
			when 89
				event.name = "Control unit battery low"
			else
				event.name = "Trap OK"
			end
			event.send_notifications
			event.set_trap_status

		end
		head :no_content
	end

end