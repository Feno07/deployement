Rails.application.routes.draw do
	root "login#index"
	get "admin", to:"admin_login#index",as:"admin_login"
	post "admin", to:'admin_login#login',as:"admin_login_post"
	get "admin/signup", to:"admin_signup#index", as:"admin_signup"
	post "admin/verification", to:"admin_signup#create", as:"admin_signup_verification"
	get "admin/dashboard", to:'dashboard#index', as: "dashboard"
	get "admin/messages", to:'admin_message#index', as:"admin_message"
	post "admin/messages/send", to:'send_admin#index', as:"admin_send_message"
	get "admin/message/:id", to:'message_admin_selected#index', as:'admin_message_selected'
	get "admin/logout",to:"admin_logout#index",as:"admin_logout"
	get 'admin/message/trash/:id', to:"admin_message#move_to_trash",as:"admin_message_trash"
	get "admin/campagne", to:'admin_campagne#index', as:'admin_campagne'
	get "admin/campagne+", to:'admin_add_campagne#index', as:'admin_add_campagne'
	post "admin/campagne+", to:'admin_add_campagne#create', as:'admin_add_campagne_post'
	get '/auth/:provider/callback', to: 'session#create'
	get 'campagne/logout', to:'session#destroy', as:'campagne_logout'
	get 'campagne', to:'campagne#index',as:'campagne'
	get 'campage/dateAsc', to:'campagne#sortDate', as:'sortDate'
	get 'campagne/sortOldToCurrent', to:'campagne#sortOldToCurrent', as:'sortOldToCurrent'
	get 'campagne/description/:id', to:"campagne_description#index", as:'campagne_description'
	get 'campagne/participer/:id',to:'campagne_participer#index', as:'campagne_participer'
	post 'campagne/participer/editer', to:'campagne_participer#updateBrief',as:'campagne_brief_edit'
	post 'campagne/participer/poster', to:'campagne_participer#poster', as:'campagne_poster_post'
	get 'campagne/poster/:id', to:'campagne_poster#index',as:"campagne_poster"
	post 'campagne/poster', to: 'campagne_poster#poster', as:"campagne_post"
	get 'campagne/profil', to: 'campagne_profil#index', as: "campagne_profil"
	get 'campagne/messages', to: 'campagne_message#index', as:"campagne_messages"
	post 'campagne/messages', to:'campagne_message#send_message', as:"campagne_messages_send"
	get "campagne/message/:id", to:'campagne_message#read_message', as:'campagne_message_selected'
	get "campagne/message/trash/:id", to:'campagne_message#move_to_trash', as:'campagne_message_trash'
	get "campagne/releve", to:'campagne_releve#index',as:'campagne_releve'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
