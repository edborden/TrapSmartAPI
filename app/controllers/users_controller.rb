class UsersController < ApplicationController

	def create
		user = User.create user_params
		render json: user
	end

	def update
		if params[:user][:password]
			if current_user.authenticate params[:user][:password]
				user = User.update params[:id], user_params
			else
				error = {errors: {password: ["Incorrect password."]}}
			end
		else
			user = User.update params[:id], user_params
		end
		
		if user
			render json: user.reload
		else
			render json: error, status: 422
		end
	end

	def user_params
		params.require(:user).permit :name,:email,:password,:admin,:company_id
	end

end
