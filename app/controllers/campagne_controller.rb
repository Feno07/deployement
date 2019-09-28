class CampagneController < ApplicationController

	def index
		@campagne = Campagne.all
	end

	def sortDate
		@campagne = Campagne.order(:created_at)
		render :template => 'campagne/index'
	end

	def sortCheepToExpensive

	end

	def sortExpensiveToCheep
	
	end

	def sortOldToCurrent
		@campagne = Campagne.order(created_at: :desc)
		render :template => 'campagne/index'
	end

	def sortCountry

	end
end
