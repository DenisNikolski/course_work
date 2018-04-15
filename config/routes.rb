Rails.application.routes.draw do

  resources :valves
  resources :pipes
  resources :pipe_descrs
  resources :radiators
  resources :radiator_descrs
  resources :categories

  get 'about' => 'about#index'
  get 'admin' => 'admin#index'
  root 'categories#index'

  devise_for :admin

  scope '/admin' do
    resources :valves
    resources :pipes
    resources :pipe_descrs
    resources :radiators
    resources :radiator_descrs
    resources :categories

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
