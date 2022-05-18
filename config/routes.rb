Rails.application.routes.draw do

  resources :event do
    resources :attendance
    resources :orders, only: [:new, :create]
  end

  resources :user

  devise_for :users
  root to: "event#index"
end
