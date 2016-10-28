Rails.application.routes.draw do
  devise_for :users
	resources :users
	resources :dashboard

	root to: "home#index"

end
