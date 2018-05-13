Rails.application.routes.draw do

  resources :customers
  resources :shopping_cart_items
  resources :shopping_carts
  resources :valves, :valve_descrs, :pipes, :pipe_descrs,
            :radiators, :radiator_descrs, :categories do
    collection {post :import_from_file}
  end

  get 'about' => 'about#index'
  get 'admin' => 'admin#index'
  get 'admin/download_file_carts'
  get 'search', to: 'categories#search'
  root 'categories#index'
  devise_for :admin
  get 'admin_new', to: 'admin#new_admin'
  post 'admin_new', to: 'admin#create_admin'
  match '/shopping_cart_items/:id', to: 'shopping_cart_items#create', via: :post
  match '/admin/:id', to: 'admin#show', as: :admin_show, via: :get
  match '/admin/:id', to: 'admin#destroy_admin', as: :destroy_admin, via: :delete

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
