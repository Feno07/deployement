class MessageAdminSelectedController < ApplicationController
	before_action :verifyAdminSession
	def index
		message_id = params[:id]
		@message_selected = AdminMessage.includes(:user).where(:admin_messages =>{:id => message_id})
	end
end
