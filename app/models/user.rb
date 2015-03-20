class User < ActiveRecord::Base
	has_secure_password
	validates :email, uniqueness: true	
	
	has_one :session
	belongs_to :company

	def global_admin
		company_id == 1
	end

end