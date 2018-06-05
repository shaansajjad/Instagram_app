Rails.application.routes.draw do

	get 'relationships/follow_user'

	get 'relationships/unfollow_user'

	get 'profiles/show'

	devise_for :users

	get "/discovery" => "discovery#index"
	
  	# get ':Username', to: 'profiles#show', as: :profile
  	get ':Username/edit', to: 'profiles#edit', as: :edit_profile

  	root :to => redirect("/users/sign_in")

  	
	 get 'follow_user', to: 'relationships#follow_user', as: :follow_user

	 get 'unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user

	resources :profiles
	get 'profiles/show'

	resources :posts do
	resources :comments
	resources :likes, :only => [:create, :destroy]

	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
