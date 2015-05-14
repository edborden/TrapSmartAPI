class TrapSerializer < ActiveModel::Serializer
	attributes :id,:name,:hardware_id,:status,:status_updated
	has_one :company, embed: :ids 
	has_one :location, embed: :ids, include:true
	has_many :notifications, embed: :ids, include:true
end