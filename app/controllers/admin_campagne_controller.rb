class AdminCampagneController < ApplicationController
	before_action :verifyAdminSession
	def index
		@campagne_list = Campagne.all
		puts @campagne_list.inspect
	end
	
end
