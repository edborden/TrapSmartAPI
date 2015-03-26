class UsersController < ApplicationController

	def create
		user = User.new user_params
		password = user.set_password
		if user.valid?
			user.save
			Mailer.new.welcome user,password
			MailchimpHandler.new.subscribe user			
			render json: user
		else
			render json: user.errors.messages, status: 422
		end
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
