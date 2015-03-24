class UsersController < ApplicationController

	def create
		user = User.create user_params
		render json: user
	end

	def user_params
		params.require(:user).permit :name,:email,:password,:admin,:company_id
	end

end
