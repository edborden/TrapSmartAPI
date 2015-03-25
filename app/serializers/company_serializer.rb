class CompanySerializer < ApplicationSerializer
	attributes :name,:address,:locality,:region,:postcode
	has_many :traps, embed_in_root: true
end