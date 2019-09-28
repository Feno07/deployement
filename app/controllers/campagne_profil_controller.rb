class CampagneProfilController < ApplicationController
	before_action :verifyUserSession
	def index
		@profil = User.includes(:participers,:campagnes).where(:users => {:id => session[:id]})
	end
end
