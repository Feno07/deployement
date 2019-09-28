class CampagneReleveController < ApplicationController
	def index
		@releve = User.includes(:participers,:campagnes).where(:users => {:id => session[:id]})
	end
end
