Rails.application.routes.draw do
  root :to =>"homes#top"
   get 'about' => "homes#about"
 # 顧客用
 # URL /customers/sign_in ...
 devise_for :customers, skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
 }

 # 管理者用
 # URL /admin/sign_in ...
 devise_for :admin, skip: [:registrations, :passwords], controllers: {
   sessions: "admin/sessions"
 }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: :public do
    resources :products, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update, :quite, :out]
    resources :cart_products, only: [:index, :update, :destroy, :all_destroy, :create]
    resources :orders, only: [:new, :log, :thanx, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]

    get 'orders/thanx'

  end

  namespace :admin do
    root :to => "homes#top"
    resources :products, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :order_details, only: [:index, :update,]
  end


end
