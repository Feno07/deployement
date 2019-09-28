class AdminSignupController < ApplicationController
	def index
		puts params[:flash]
	end

	def create
			if params[:username] != "" && params[:password] != "" 
				if params[:password] == params[:password_confirm]
					admin_exist = Admin.find_by_username(params[:username])
					if admin_exist == nil
						Admin.create(username:params[:username],password:params[:password])
						redirect_to admin_login_url
					else
						flash[:danger] = "Username déja pris!!!!"
						redirect_to admin_signup_url
					end
				else
					flash[:danger] = "Password ne correspond pas!!!!"
					redirect_to admin_signup_url
				end
			else
				flash[:danger] = "Les champs ne doivent pas être vide!!!!!"
				redirect_to admin_signup_url
			end
	end

end
