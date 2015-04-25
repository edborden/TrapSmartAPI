class CompanySerializer < ApplicationSerializer
	attributes :name,:address,:locality,:region,:postcode,:premium
	has_many :traps
	has_many :notifications
end