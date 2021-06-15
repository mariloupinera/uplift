Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :favours, only: [:index, :show, :create, :new] do
    resources :applications, only: [:create, :edit, :update], shallow: true
    end
  resources :applications, only: [:index]
  resources :credits, only: [:index, :show, :create]
end

