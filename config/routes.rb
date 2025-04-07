Rails.application.routes.draw do
  devise_for :users, path: :gurus, path_name: { sign_in: :login, sign_out: :logout }

  root 'tests#index'

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  resources :gists, only: :create

  namespace :admin do
    resources :gists, only: :index
    resources :badges
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true do
        resources :answers, shallow: true, except: :index
      end
    end
  end

  resources :badges_users, only: :index

  resources :reviews, only: %i[new create]
end
