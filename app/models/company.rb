class Company < ActiveRecord::Base
	has_many :users
	has_many :traps
	has_many :notifications, as: :notifiable
end