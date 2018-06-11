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
	resources :searches
	get 'profiles/show'

	resources :posts do
		resources :comments
			member do
				put "like" => "posts#vote"
			# resources :likes, :only => [:create, :destroy]
			end
	end

	
end
