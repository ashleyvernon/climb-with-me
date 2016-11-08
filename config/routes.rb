Rails.application.routes.draw do
	default_url_options :host => "example.com"
	
  	devise_for :users
  	
	resources :users, :controller => 'users'
	resources :dashboard

	root to: "home#index"

	get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
	get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
	get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

	get "messages/inbox" => "message#inbox"
	get "messages/create/:to_id" => "message#create_get"
	post "messages/create/:to_id" => "message#create_post"

	#conversations
	resources :conversations do
		member do
			post :reply
			post :trash
			post :untrash
		end

	end
end
