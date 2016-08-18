class MessageController < ActionController::API
	include ActionController::HttpAuthentication::Basic::ControllerMethods

	http_basic_authenticate_with name: "1faafdceeba45ad26f97a061b", password: "afbc67f939eea5b3f5753dba7c5fe"

	def create

		if params[:type] == "test_ping"
			head :no_content
		else

			event_code = params[:data][:event_code].to_i
			event_type = params[:data][:event_type]
			hardware_id = params[:data][:device_name]
			lat = params[:data][:gps_latitude]
			lng = params[:data][:gps_longitude]

			unless event_code == 91

				trap = Trap.find_by hardware_id: hardware_id
				if trap

					trap.set_location lat,lng	

					## event
					event = Event.new trap_id:trap.id
					case event_code
					when 110
						event.name = "Trap closed"
					when 109
						event.name = "Sensor unit battery low"
					when 89
						event.name = "Control unit battery low"
					when 108
						event.name = "External power went above 10V"
					when 30
						event.name = "Powered on"
					when 15,86
						event.name = "Network check"
					else
						event.name = "Code #{event_code}: #{event_type}"
					end

					unless event_code == 89 && trap.too_soon_to_update
						event.send_notifications
						event.set_trap_status
					end

				end

			end
			
			head :no_content
		end
	end

end