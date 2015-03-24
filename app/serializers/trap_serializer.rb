class TrapSerializer < ApplicationSerializer
	attributes :name,:hardware_id
	has_one :company
end