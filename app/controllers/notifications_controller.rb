class NotificationsController < ApplicationController

	def create
		notification = Notification.new notification_params
		if params[:notification][:company_id]
			company = Company.find  params[:notification][:company_id]
			company.notifications << notification
		else
			trap = Trap.find params[:notification][:trap_id]
			trap.notifications << notification
		end		
		render json: notification
	end

	def destroy
		notification = Notification.find params[:id]
		notification.destroy
		head :no_content
	end

	def notification_params
		params.require(:notification).permit :mode,:target
	end

end
