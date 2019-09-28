class AdminLoginController < ApplicationController
	def index

	end

	def login
		if params[:username] != "" && params[:password] != "" 
				admin_exist = Admin.find_by_username(params[:username])
				if admin_exist != nil && admin_exist.authenticate(params[:password])
					session[:auth] = params[:username]
					redirect_to dashboard_url
				else
					flash[:danger] = "Erreur d'Authetification!!!!"
					redirect_to admin_login_url
				end
		else
			flash[:danger] = "Les champs ne doivent pas être vide!!!!!"
			redirect_to admin_login_url
		end
	end
end
