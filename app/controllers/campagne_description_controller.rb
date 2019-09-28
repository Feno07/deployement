class CampagneDescriptionController < ApplicationController
	before_action :verifyUserSession
	def index
		id = params[:id]
		@campagne = Campagne.includes(:images, :entreprise).where(:campagnes =>{:id => id});
	end
end
