Rails.application.routes.draw do
  get 'categories/new'

  get 'categories/create'

  get 'categories/update'

  get 'categories/edit'

  get 'categories/destroy'

  get 'categories/index'

  get 'categories/show'

  get 'pipes/new'

  get 'pipes/create'

  get 'pipes/update'

  get 'pipes/edit'

  get 'pipes/destroy'

  get 'pipes/index'

  get 'pipes/show'

  get 'about/index'

  get 'about' => 'about#index'

  root 'pipes#index'

  resources :pipes
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
