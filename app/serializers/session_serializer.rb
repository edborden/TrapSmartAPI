class SessionSerializer < ApplicationSerializer
	attributes :token
	has_one :user
end