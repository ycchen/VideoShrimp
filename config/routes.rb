Rails.application.routes.draw do

	root 'videos#index'
	resources :videos

  get '/videos/:id/like' => 'videos#like'
  get '/videos/:id/dislike' => 'videos#dislike'
  
  devise_for :users

  resources :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
