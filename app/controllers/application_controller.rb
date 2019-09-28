class ApplicationController < ActionController::Base
	def verifyUserSession
		if session[:uid] == nil || !defined?(session[:uid])
			redirect_to root_path
		end
	end

	def verifyAdminSession
		if !defined?(session[:auth]) || session[:auth] == nil
			redirect_to admin_login_path
		end
	end
end
