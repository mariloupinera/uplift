Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :favours, only: [:index, :show, :create, :new] do
    resources :applications, only: [:create, :edit, :update, :show], shallow: true do
      resources :reviews, only: [:new, :create, :index]
      member do
      get 'mark_as_done'
      end
    end
  end

  resources :applications, only: [:index] do
    resources :messages, only: [:create]
  end
  resources :credits, only: [:index, :create] do
    collection do
      get :redeem
      get :jobs
    end
  end
  get '/done_applications', to: 'applications#index_done_applications'
  get "/my_applications", to: "applications#my_applications"
  end
