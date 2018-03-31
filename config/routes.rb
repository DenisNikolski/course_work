Rails.application.routes.draw do
  get 'radiator_descrs/new'

  get 'radiator_descrs/create'

  get 'radiator_descrs/update'

  get 'radiator_descrs/edit'

  get 'radiator_descrs/destroy'

  get 'radiator_descrs/index'

  get 'radiator_descrs/show'

  get 'radiators/new'

  get 'radiators/create'

  get 'radiators/update'

  get 'radiators/edit'

  get 'radiators/destroy'

  get 'radiators/index'

  get 'radiators/show'

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

  get 'pipe_descrs/new'

  get 'pipe_descrs/create'

  get 'pipe_descrs/update'

  get 'pipe_descrs/edit'

  get 'pipe_descrs/destroy'

  get 'pipe_descrs/index'

  get 'pipe_descrs/show'

  get 'about/index'

  get 'about' => 'about#index'

  root 'categories#index'

  resources :pipe_descrs
  resources :pipes
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
