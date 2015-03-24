class CompanySerializer < ApplicationSerializer
	attributes :name,:address,:locality,:region,:postcode
	has_many :traps
end