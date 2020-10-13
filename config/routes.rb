Rails.application.routes.draw do
  
  get   'charges/new/gifts/:id', to: 'charges#new', as: :new_charge
  get   'searched_user/:id', to: 'users#searched_user', as: :searched_user
  get   'searched_registry/:id', to: 'registries#searched_registry', as: :searched_registry
  resources :gifts
  resources :registries
  resources :charges
  
  get 'users/show'

  root 'static_pages#top'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    get :search, on: :collection
  end
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
