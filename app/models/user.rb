class User < ActiveRecord::Base
	has_secure_password
	validates :email, uniqueness: true
	
	has_one :session, dependent: :destroy
	belongs_to :company

	def global_admin
		company_id == 1
	end

	def set_password
		self.password = "123456" #SecureRandom.hex(8)
	end

end