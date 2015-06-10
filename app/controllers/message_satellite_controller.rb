class MessageSatelliteController < ActionController::API
	include ActionController::HttpAuthentication::Basic::ControllerMethods

	http_basic_authenticate_with name: "39eea5b3f5753dad26f97a061b", password: "afbc67f9ba7c5fe45ad26f97a061b"

	def create
		request_hash = Hash.from_xml(request.body.read)["trackermessages"]["trackermessage"]
		puts request_hash
		
		hardware_id = request_hash["asset"]["esn"]
		type = request_hash["type"]
		positional = request_hash["positional"]

		if type == "smartone_replace_battery"
			event_code = 9999
		else
			event_code_hash = request_hash["payload"]["field"].find {|obj| obj["name"] == "smartone_standard_message_cause"}
			event_code = event_code_hash["data"].to_i
			puts event_code
			digital_1_alarm_hash = request_hash["payload"]["field"].find {|obj| obj["name"] == "digital_1_alarm"}
			digital_1_alarm = digital_1_alarm_hash["data"] == "true"
			puts digital_1_alarm
			digital_2_alarm_hash = request_hash["payload"]["field"].find {|obj| obj["name"] == "digital_2_alarm"}
			digital_2_alarm = digital_2_alarm_hash["data"] == "true"
			puts digital_2_alarm		
		end

		if positional
			lat = request_hash["position"]["coordinate"]["latitude"]
			lng = request_hash["position"]["coordinate"]["longitude"]
		end

		trap = Trap.find_by hardware_id: hardware_id
		if trap		

			if positional
				trap.set_location lat,lng	
			end

			## event
			event = Event.new trap_id:trap.id
			case event_code
			when 100,11 #100 = "undesired_input_state"
				if digital_1_alarm
					event.name = "Trap closed"
				elsif digital_2_alarm
					event.name = "Sensor unit battery low"
				end
			when 9999
				event.name = "Control unit battery low"
			when 1
				event.name = "Powered on"
			when 0
				event.name = "Network check" #"Location Message"
			#else
			#	event.name = "Code #{event_code}: #{event_type}"
			end
			event.send_notifications
			event.set_trap_status

		end
		
		head :no_content
	end

end