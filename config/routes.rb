Rails.application.routes.draw do
  root :to =>"homes#top"
   get 'homes/about', as:"about"


 # 顧客用
 devise_for :customers, skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
 }

 scope module: :public do
    get 'orders/thanks' => "orders#thanx"

    resources :products, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update, :quite, :out]
    resources :cart_products, only: [:index, :update, :destroy, :all_destroy, :create]
    resources :orders, only: [:new, :log, :thanx, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]


    # 退会確認画面
    get "/customers/quite" => 'customers#quite', as: 'quite'
    # 論理削除用のルーティング
    patch "/customers/out" => 'customers#out', as: 'out'

  end

 # 管理者用
 devise_for :admin, skip: [:registrations, :passwords], controllers: {
   sessions: "admin/sessions"
 }



  namespace :admin do
    root :to => "homes#top"
    resources :products, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show]
    resources :order_details, only: [:update]
  end


end

