class CampagneParticiperController < ApplicationController
	before_action :verifyUserSession
	def index
		id = params[:id]
		@campagne = Campagne.includes(:images, :entreprise).where(:campagnes => { :id => id})
	end

	def updateBrief
		id = params[:id]
		brief = params[:brief_campagne]
		Campagne.where(:id => id).update(:brief => brief)
		redirect_to campagne_participer_path(id: id)
	end

	def poster
		Campagne.where(id:params[:id]).update(image_post_url: params[:image_url])
		
		redirect_to campagne_poster_url(id:params[:id])
	end

end
