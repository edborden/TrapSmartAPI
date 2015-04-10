class TrapSerializer < ApplicationSerializer
	attributes :name,:hardware_id,:status,:status_updated
	has_one :company
	has_one :location, embed_in_root:true
	has_many :notifications,embed_in_root:true
end