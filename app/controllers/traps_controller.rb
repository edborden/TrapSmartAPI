class TrapsController < ApplicationController

	def create
		trap = Trap.create trap_params
		render json: user
	end

	def trap_params
		params.require(:trap).permit :name,:hardware_id,:company_id
	end

end
