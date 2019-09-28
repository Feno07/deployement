class Admin < ApplicationRecord
	has_secure_password
	has_many :admin_messages
	has_many :user_messages
end
