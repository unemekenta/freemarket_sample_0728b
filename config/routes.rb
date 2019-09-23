Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "users", sessions: 'users/sessions', omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  get 'telltest' => 'products#teltest' 

  resources :products do
    resources :purchases, only: [:new] do
      collection do
        post 'pay', to: 'purchases#pay'
        get 'done', to: 'purchases#done'
      end
    end
    collection do
      post 'purchase'
    end
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
    resources :deliveraddresses, only: [:new, :create]
    member do
      get 'mypage'
      get 'notification'
      get 'todo'
      get 'like'
      get 'sales'
      get 'point'
      get 'profile'
      get 'email_password'
      get 'purchased'
      get 'forsell'
      get 'in_progress'
      get 'completed'
      get 'logout'
      get 'identification'
    end
    collection do
      get 'step1'
      get 'step2'
    end
  end
 
  resources :category, only: [:show]
  resources :brands, only: [:show]

end

