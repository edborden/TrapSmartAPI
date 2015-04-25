class TrapSerializer < ApplicationSerializer
	attributes :name,:hardware_id,:status,:status_updated
	has_one :company
	has_one :location
	has_many :notifications
end