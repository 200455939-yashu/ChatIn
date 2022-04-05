Rails.application.routes.draw do
  resources :participants
  resources :messages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	get '/signin', to: 'sessions#new'
	post '/signin', to: 'sessions#create'
	delete '/signout', to: 'sessions#destroy'

	#
	resources :chatboxes do
		resources :messages
	end
	resources :users
	root 'chatboxes#index'
end
