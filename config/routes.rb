Rails.application.routes.draw do
  root :to =>"homes#top"
   get 'homes/about'

 # 顧客用
 devise_for :customers, skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
 }

 # 管理者用
 devise_for :admin, skip: [:registrations, :passwords], controllers: {
   sessions: "admin/sessions"
 }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope modele: :public do
    resources :products, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update, :quite, :out]
    resources :cart_products, only: [:index, :update, :destroy, :all_destroy, :create]
    resources :orders, only: [:new, :log, :thanx, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]

    get 'orders/thanx'
    # 退会確認画面
    get "/customers/quite" => 'customers#quite', as: 'quite'
    # 論理削除用のルーティング
    patch "/customers/out" => 'customers#out', as: 'out'

  end

  namespace :admin do
    root :to => "homes#top"
    resources :products, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :order_details, only: [:index, :update,]
  end


end
