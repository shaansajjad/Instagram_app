Rails.application.routes.draw do

  get 'profiles/show'

  devise_for :users
  resources :users, only: [:index]
  # root 'welcome#index'
  # get ':Username', to: 'profiles#show', as: :profile

root :to => redirect("/users/sign_in")
# get 'posts/index'

resources :profiles
get 'profiles/show'

 resources :posts do
 	resources :comments
 end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
