class AdminMessageController < ApplicationController
	before_action :verifyAdminSession
	def index
		@message_sended = AdminMessage.includes(:admin,:user).all.where(:admin_messages =>{:status => 'send'},:admins =>{:username => session[:auth]})
		@message_get = AdminMessage.includes(:admin,:user).all.where(:admin_messages =>{:status => 'get'},:admins =>{:username => session[:auth]})
		@message_trash = AdminMessage.includes(:admin,:user).all.where(:admin_messages =>{:status => 'trash'},:admins =>{:username => session[:auth]})
		@user = User.all
	end

	def move_to_trash
		message_id = params[:id]
		AdminMessage.where(id:message_id).update(status:'trash')
		redirect_to campagne_messages_url
	end
end
