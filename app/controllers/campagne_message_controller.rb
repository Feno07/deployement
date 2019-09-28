class CampagneMessageController < ApplicationController
	before_action :verifyUserSession
	def index
		@message_sended_campagne = UserMessage.includes(:user).all.where(:user_messages =>{:status => 'send'},:users =>{:uid => session[:uid]})
		@message_get_campagne = UserMessage.includes(:user).all.where(:user_messages =>{:status => 'get'},:users =>{:uid => session[:uid]})
		@message_trash = UserMessage.includes(:user).all.where(:user_messages =>{:status => 'trash'},:users =>{:uid => session[:uid]})
	end

	def send_message
		message = params[:message]
		user = User.find_by_uid(session[:uid])
		user_id = user.id
		admins = Admin.all
		date = DateTime.now

		unless admins.empty?
			admins.each do |admin|
				UserMessage.create(user_id: user_id ,admin_id:admin.id,content:message,date:date, status:'send')
				AdminMessage.create(admin_id:admin.id,user_id: user_id , content:message,date:date, status:'get')
			end
		end

		redirect_to campagne_messages_url
	end

	def read_message
		message_id = params[:id]
		@message_selected = UserMessage.includes(:user).where(:messages =>{:id => message_id})
		render :template => 'campagne_message_read/index'
	end

	def move_to_trash
		message_id = params[:id]
		UserMessage.where(id:message_id).update(status:'trash')
		redirect_to campagne_messages_url
	end
end
