Rails.application.routes.draw do
  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
}
  devise_for :customer, controllers: {
  sessions:      'customer/sessions',
  passwords:     'customer/passwords',
  registrations: 'customer/registrations'
}


    namespace :admin do
      resources :genres, only:[:index, :create, :edit, :update]
      resources :items, only:[:index, :new, :create, :show, :edit, :update]
      resources :customers, only:[:index, :show, :edit, :update]
      resources :orders, only:[:show, :update]
    root to: 'homes#top'
  end


  root to: 'homes#top'
  get '/about' => 'homes#about'

  resources :items, only:[:index, :show] do
    collection do
      get :genre_finding
    end
  end

  resource :customers, only:[:show, :edit, :update]
  get '/customers/alert' => 'customers#alert'
  get '/customers/leave' => 'customers#leave'

  resources :addresses, only:[:edit, :create, :update, :destroy, :index]

  resources :cart_items, only:[:index, :update, :destroy, :create]
  get '/cart_items/destroy_all' => 'cart_items#destroy_all'

  resources :orders, only:[:new, :create, :index, :show] do
    collection do
      post :confirm
      get :order
    end
  end

end
