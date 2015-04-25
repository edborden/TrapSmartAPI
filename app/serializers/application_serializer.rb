class ApplicationSerializer < ActiveModel::Serializer
	attributes :id
	embed :ids, include: true

end