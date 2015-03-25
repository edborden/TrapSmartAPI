class SessionsController < ApplicationController
	skip_before_action :ensure_authenticated_user, except: :destroy

	def create
		user = User.find_by(email: params[:session][:email])
		if user
			if user.authenticate params[:session][:password]
				user.session.try(:destroy)
				render json: user.create_session
			else
				error = {errors: {password: ["Incorrect password."]}}
				render json: error, status: 422
			end
		else
			error = {errors: {email: ["We don't have a user with that email address."]}}
			render json: error, status: 422
		end
	end

	def index
		session = Session.find_by_token params[:token]
		if session
			render json: [session]
		else
			head :unauthorized
		end
	end

	def destroy
		current_user.session.destroy
		head :no_content
	end

end