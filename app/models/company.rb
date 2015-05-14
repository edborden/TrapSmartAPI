class Company < ActiveRecord::Base
	has_many :users, dependent: :destroy
	has_many :traps, dependent: :destroy
	has_many :notifications, as: :notifiable, dependent: :destroy
end