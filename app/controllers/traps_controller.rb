class TrapsController < ApplicationController
	before_filter :set_trap, except: :create

	def create
		@trap = Trap.new trap_params
		if @trap.valid?
			count = @trap.company.traps.count + 1
			@trap.name = "Trap " + count.to_s
			@trap.save	
			render json: @trap
		else
			render json: {errors: @trap.errors}, status: :unprocessable_entity
		end
	end

	def update
		if @trap.update trap_params
			head :no_content
		else
			render json: {errors: @trap.errors}, status: :unprocessable_entity
		end		
	end

	def destroy
		@trap.destroy
		head :no_content
	end

	def set_trap
		@trap = Trap.find params[:id]
	end

	def trap_params
		params.require(:trap).permit :name,:hardware_id,:company_id
	end

end
