class TrapsController < ApplicationController

	def create
		trap = Trap.new trap_params
		if trap.valid?
			count = trap.company.traps.count + 1
			trap.name = "Trap " + count.to_s
			trap.save	
			render json: trap
		else
			render json: trap.errors.messages, status: 422
		end
	end

	def update
		trap = Trap.update params[:id], trap_params
		if trap.valid?	
			render json: trap
		else
			render json: trap.errors.messages, status: 422
		end		
	end

	def trap_params
		params.require(:trap).permit :name,:hardware_id,:company_id
	end

end
