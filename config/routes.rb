Rails.application.routes.draw do
  resources :gifts
  resources :registries
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
