Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers

    namespace :admin do
    resources :genres, only:[:index, :create, :edit, :update]
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    root to: 'homes#top'
  end
end
