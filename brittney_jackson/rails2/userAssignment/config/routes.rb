Rails.application.routes.draw do
  get 'secrets/index'

  resources :userss, except: [:index]

  resources :sessions, only: [:new, :create, :destroy]

	get 'secrets' => 'secrets#index'
	post 'secrets' => 'secrets#create'
	delete 'secrets'=> 'secrets#delete'

end
