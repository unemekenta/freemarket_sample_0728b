Rails.application.routes.draw do
  get 'purchase/index'
  get 'purchase/done'
  get 'credit_card/new'
  get 'credit_card/show'
  get 'products/index'
  get 'products/pay'
  devise_for :users, controllers: { registrations: "users", sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  get 'telltest' => 'products#teltest' 
  resources :products, only: [:index, :new, :update, :create, :show, :edit] do
    collection do
      post 'purchase'
    end
  end
  resources :users, only: [:show, :new, :create, :edit, :update ] do
    member do
      get 'mypage'
      get 'notification'
      get 'todo'
      get 'like'
      get 'sales'
      get 'point'
      get 'profile'
      get 'update'
      get 'deliver_address'
      get 'card'
      get 'email_password'
      get 'purchase'
      get 'purchased'
      get 'forsell'
      get 'in_progress'
      get 'completed'
      get 'logout'
    end
    collection do
      get 'step1'
      get 'step2'
    end
  end

  resources :credit_card, only: [:new, :show] do
    collection do
      post 'show', to: 'credit_card#show'
      post 'pay', to: 'credit_card#pay'
      post 'delete', to: 'credit_card#delete'
    end
  end

  resources :purchase, only: [:index] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
end

