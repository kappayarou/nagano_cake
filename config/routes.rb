Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  resources :genres, only:[:index, :create, :edit, :update]
end
