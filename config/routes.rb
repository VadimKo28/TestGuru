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

  namespace :admin do
    resources :tests do

      resources :questions, shallow: true do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
