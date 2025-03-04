Rails.application.routes.draw do
  root 'users#new'

  get :sign_up, to: 'users#new'
  get :login, to: 'sessions#new'
  delete :sign_out, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
