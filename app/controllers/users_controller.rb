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
		if params[:user][:new_password]
			if current_user.authenticate params[:user][:password]
				current_user.password = params[:user][:new_password]
				current_user.save
			else
				error = {errors: {password: ["Original password is incorrect."]}}
			end
		else
			user = User.update params[:id], user_params
		end

		if user
			render json: user.reload
		elsif error
			render json: error, status: 422
		else
			head :no_content
		end
	end

	def user_params
		params.require(:user).permit :name,:email,:admin,:company_id
	end

end
