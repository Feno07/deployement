class SendAdminController < ApplicationController
	before_action :verifyAdminSession
	def index
		user_id = params[:select_user]
		message = params[:message]
		admin = Admin.find_by_username(session[:auth])
		puts 'eot ilay izy'
		date = DateTime.now
		if user_id != ''
			UserMessage.create(user_id: user_id ,admin_id:admin.id,content:message,date:date, status:'get')
			AdminMessage.create(admin_id:admin.id, user_id: user_id, content:message,date:date, status:'send')
		end
		
		redirect_to admin_message_url
	end
end
