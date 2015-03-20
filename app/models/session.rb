class Session < ActiveRecord::Base
	belongs_to :user
	before_create :issue_token

	def issue_token
		self.token = SecureRandom.hex
	end

end