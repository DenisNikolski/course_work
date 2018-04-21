Rails.application.routes.draw do

  resources :valves, :valve_descrs, :pipes, :pipe_descrs,
            :radiators, :radiator_descrs, :categories do
    collection {post :import_from_file}
  end

  get 'about' => 'about#index'
  get 'admin' => 'admin#index'
  root 'categories#index'

  devise_for :admin
  get 'admin_new', to: 'admin#new_admin'
  post 'admin_new', to: 'admin#create_admin'
  match '/admin/:id', to: 'admin#show', as: :admin_show, via: :get
  match '/admin/:id', to: 'admin#destroy', as: :destroy_admin, via: :delete

  # scope '/admin' do
  #   resources :valves, :valve_descrs, :pipes, :pipe_descrs,
  #             :radiators, :radiator_descrs, :categories
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
