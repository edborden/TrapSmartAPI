class UserSerializer < ApplicationSerializer
	attributes :email,:name
	has_one :company, embed_in_root: true
end