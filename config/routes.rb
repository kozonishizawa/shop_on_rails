Rails.application.routes.draw do

  get    'about',                 to: 'home#about'
  get    'contact',               to: 'home#contact'
  get    '/signup',               to: 'users#new'
  post   '/signup',               to: 'users#create'
  get    '/login',                to: 'sessions#new'
  post   '/login',                to: 'sessions#create'
  delete '/logout',               to: 'sessions#destroy'

  
  # TOP
  root 'home#top'
  
  # 管理者
  namespace :admin do
    
    root 'home#index'
    get 'search', to: 'products#search'
    
    #ユーザー管理
    resources :users
    
    #商品管理
    resources :products
    
    #カテゴリ管理
    resources :categories, except: [:show]
    
    #購入者情報
    resources :purchasers, except: [:new, :create]
    
    #注文商品
    resources :ordered_items, only: [:show, :update, :destroy]

    #お問い合わせ
    resources :contacts, only: [:index, :show]
    
  end
  
  namespace :front do

    #お問い合わせ
    resources :contacts, only: [:index, :create]
    
  end
  
  resources :users, except: [:index, :destroy]
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :products, only: [:index, :show]
  resources :cart_items

  get    'procedures/login_form',      to: 'procedures#login_form'
  get    'procedures/new',             to: 'procedures#new'
  get    'procedures/entry_form',      to: 'procedures#entry_form'
  get    'procedures/nonmember_form',  to: 'procedures#nonmember_form'
  post   'procedures/entry',           to: 'procedures#entry'
  patch  'procedures/entry',           to: 'procedures#entry'
  post   'procedures/create',          to: 'procedures#create'
  post   'procedures/purchase',        to: 'procedures#purchase'
  get    'procedures/confirmation',    to: 'procedures#confirmation'
  get    'procedures/select_method',   to: 'procedures#select_method'
  patch  'procedures/decide_method',   to: 'procedures#decide_method'
  post   'procedures/payment',         to: 'procedures#payment'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
