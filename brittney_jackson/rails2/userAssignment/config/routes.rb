Rails.application.routes.draw do
  resources :userss, except: [:index]

  resources :sessions, only: [:new, :create, :destroy]

end
