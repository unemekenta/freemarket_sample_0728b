Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "users", omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'user' => 'users#profile'
    put 'user' => 'users#update'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  get 'telltest' => 'products#teltest' 

  resources :products do
    resources :purchases, only: [:new] do
      collection do
        post 'pay', to: 'purchases#pay'
        post 'pay_with_discount', to: 'purchases#pay_with_discount'
        get 'confirm', to: 'purchases#confirm'

      end
    end
    collection do
      post 'purchase'
      get 'search'
    end
    resources :comments, only: [:create, :update, :destroy]
  end

  namespace :api do
    resources :products, only: :show, defaults: { format: 'json'}
  end

  resources :users do
    resources :deliveraddresses, only: [:new, :create, :edit, :update]
    resources :credit_card, only: [:new, :show] do
      collection do
        post 'show', to: 'credit_card#show'
        post 'pay', to: 'credit_card#pay'
        post 'delete', to: 'credit_card#delete'
      end
    end
    member do
      get 'mypage'
      get 'notification'
      get 'todo'
      get 'like_show'
      get 'sales'
      get 'point'
      get 'profile'
      get 'email_password'
      get 'purchased'
      get 'forsell'
      get 'in_progress'
      get 'completed'
      get 'all_evaluations'
      get 'good_evaluations'
      get 'normal_evaluations'
      get 'bad_evaluations'
      get 'logout'
      get 'identification'
      get 'introduction'
    end
    collection do
      get 'step1'
      get 'step2'
    end
    resources :evaluations, only: [:new, :create] do
    end
  end
  resources :category, only: [:show, :index]
  resources :brands, only: [:show]
  post   '/like/:product_id' => 'likes#like',   as: 'like'
  delete '/like/:product_id' => 'likes#unlike', as: 'unlike'

  get 'administrators/give_point', to: 'administrators#give_point'
  get 'administrators/give_point_result', to: 'administrators#give_point_result'
  post 'administrators/give_point_result_done', to: 'administrators#give_point_result_done'
  
  get 'confirm' => 'roulette#confirm'
  post 'roulette' => 'roulette#roulette'
end

