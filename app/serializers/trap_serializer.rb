class TrapSerializer < ActiveModel::Serializer
	attributes :id,:name,:hardware_id,:status,:status_updated
	has_one :company, embed: :ids, include: false 
	has_one :location, embed: :ids
	has_many :notifications, embed: :ids
end