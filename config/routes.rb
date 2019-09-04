Rails.application.routes.draw do
  
  # TOP
  root                              'home#top'

  # 管理者
  namespace :admin do
  
    root 'home#index'
    
  end


  get 	 'about'          	     => 'home#about'
  get    'contact'               => 'home#contact'
  get    '/signup'               => 'users#new'
  post   '/signup'               => 'users#create'
  get    '/login'                => 'sessions#new'
  post   '/login'                => 'sessions#create'
  delete '/logout'               => 'sessions#destroy'
  
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :products
  resources :cart_items
  patch  'cart_items/add_one'        => 'cart_items#add_one'

  get    'procedures/login_form'      => 'procedures#login_form'
  get    'procedures/new'             => 'procedures#new'
  get    'procedures/entry_form'      => 'procedures#entry_form'
  get    'procedures/nonmember_form'  => 'procedures#nonmember_form'
  post   'procedures/entry'           => 'procedures#entry'
  patch  'procedures/entry'           => 'procedures#entry'
  post   'procedures/create'          => 'procedures#create'
  post   'procedures/purchase'        => 'procedures#purchase'
  get    'procedures/confirmation'    => 'procedures#confirmation'
  get    'procedures/select_method'   => 'procedures#select_method'
  patch   'procedures/decide_method'   => 'procedures#decide_method'
  post   'procedures/payment'         => 'procedures#payment'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
