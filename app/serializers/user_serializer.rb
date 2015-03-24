class UserSerializer < ApplicationSerializer
	attributes :email,:name,:global_admin
	has_one :company, embed_in_root: true
end