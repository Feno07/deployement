class User < ApplicationRecord
	has_many :user_messages
	has_many :admin_messages
	has_many :participers
  	has_many :campagnes, through: :participers

	def self.sign_in_from_omniauth(auth)
		find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
	end

	def self.create_user_from_omniauth(auth)
		create(
			provider: auth['provider'],
			uid: auth['uid'],
			username: auth['info']['name'],
			email: auth['info']['email'],
			user_token: auth.credentials['token'],
			status: 'influenceur',
			photo:auth['info']['image'],
			date_membre: Date.today.to_s
		)
	end

end
