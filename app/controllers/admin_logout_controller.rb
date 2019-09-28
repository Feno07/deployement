class AdminLogoutController < ApplicationController
	def index
		session[:auth] = nil
		redirect_to admin_login_url
	end
end
