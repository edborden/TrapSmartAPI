class CompanySerializer < ApplicationSerializer
	attributes :name,:address,:locality,:region,:postcode,:premium
	has_many :traps, embed_in_root: true
	has_many :notifications,embed_in_root:true
end