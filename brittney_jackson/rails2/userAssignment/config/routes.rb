Rails.application.routes.draw do

  resources :userss, except: [:index]

  resources :sessions, only: [:new, :create, :destroy]

	get 'secrets' => 'secrets#index'
	post 'secrets' => 'secrets#create'
	delete 'secrets'=> 'secrets#delete'
	post 'likes' => 'likes#create'
	delete 'likes' => 'likes#destroy'

end
