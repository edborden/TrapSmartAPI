class TrapsController < ApplicationController

	def create
		company = Company.find params[:trap][:company_id]
		count = company.traps.count + 1
		params[:trap][:name] = "Trap " + count.to_s
		trap = Trap.create trap_params
		render json: trap
	end

	def trap_params
		params.require(:trap).permit :name,:hardware_id,:company_id
	end

end
