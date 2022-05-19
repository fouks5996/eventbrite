Rails.application.routes.draw do

  resources :event do
    resources :attendance
    resources :orders, only: [:new, :create]
    resources :pics, only: [:create]
  end

  resources :user do
    resources :avatars, only: [:create]
  end

  devise_for :users
  root to: "event#index"
end
