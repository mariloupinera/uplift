Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :favours, only: [:index, :show, :create] do
    resources :applications, only: [:create, :edit, :update]
    end
  resources :applications, only: [:index]
  resources :credits, only: [:index, :show]
end

