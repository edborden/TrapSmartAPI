class SessionSerializer < ApplicationSerializer
	attributes :token
	has_one :user, embed_in_root: true
end