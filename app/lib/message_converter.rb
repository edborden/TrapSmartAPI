class MessageConverter

	def initialize event_code,hardware_id,latitude,longitude
		@event_code = event_code
		@hardware_id = hardware_id
		@latitude = latitude
		@longitude = longitude

		convert
	end

	def convert

		unless @event_code == 91

			trap = Trap.find_by hardware_id: @hardware_id
			if trap

				## location
				location = trap.location
				unless location
					location = Location.create
					trap.location = location
				end
				location.lat = @latitude
				location.lng = @longitude
				location.save

				## event
				event = Event.new trap_id:trap.id
				case @event_code
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
					event.name = "Code #{params[:data][:event_code]}: #{params[:data][:event_type]}"
				end
				event.send_notifications
				event.set_trap_status

			end

		end

	end

end