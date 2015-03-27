class ContactsController < ApplicationController
	skip_before_action :ensure_authenticated_user

	def create
		Mailer.new.contact_form contact_params
		head :no_content
	end

	def contact_params
		params.require(:contact).permit :name,:company,:phone,:email,:message
	end

end
