class SessionController < ApplicationController
	def create 
		auth = request.env['omniauth.auth']
		user = User.sign_in_from_omniauth(auth)
		session[:uid] = user.uid
		session[:id] = user.id
		redirect_to campagne_url, notice: 'Sign in'
	end

	def destroy
		session[:uid] = nil
		session[:id] = nil
		redirect_to root_url, notice: 'Signed out'
	end
end