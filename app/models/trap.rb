class Trap < ActiveRecord::Base
	validates :hardware_id, uniqueness: true
	validates :hardware_id, presence: true
	belongs_to :company
	has_one :location, as: :locationable
end