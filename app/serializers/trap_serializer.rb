class TrapSerializer < ApplicationSerializer
	attributes :name,:hardware_id
	has_one :company
	has_one :location, embed_in_root:true
	has_many :notifications,embed_in_root:true
end