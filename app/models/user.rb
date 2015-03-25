class User < ActiveRecord::Base
	has_secure_password
	validates :email, uniqueness: true
	before_create :set_password
	
	has_one :session
	belongs_to :company

	def global_admin
		company_id == 1
	end

	def set_password
		self.password = SecureRandom.hex(8)
	end

end