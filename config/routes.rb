Rails.application.routes.draw do
 
# 顧客用
devise_for :customers,skip: [:passwords,], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

root 'homes#top'
get '/home/about' => 'homes#about'

namespace :customers do
  resource :customers, only: [:show, :update, :edit, :unsubscribe, :withdraw]
  resources :address, only: [:index, :create, :edit, :update, :destroy]
  resources :product, only: [:index, :show]
  resources :cart_items, only: [:index, :create, :update, :destroy, :all_destroy]
  resources :orders, only: [:new, :confirm, :create, :complate, :index, :show]
end
  

# 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  
namespace :admin do
  resources :customers, only: [:index, :edit, :create, :update]
  resources :products, only: [:new, :index, :show, :edit, :update, :create]
  get 'top' => 'products#top'
  resources :genres, only: [:index, :edit, :create, :update]
  resources :orders, only: [:show, :update]
  resource :order_details, only: [:update]

end

end

