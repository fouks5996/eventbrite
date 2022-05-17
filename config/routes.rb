Rails.application.routes.draw do

  resources :event

  resources :user


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "event#index"
end
