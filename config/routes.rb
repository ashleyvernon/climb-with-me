Rails.application.routes.draw do
  devise_for :users
	resources :users
	resources :dashboard

	root to: "home#index"

	get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
	get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
	get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

end
