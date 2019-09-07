Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users", sessions: 'users/sessions', omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  get 'telltest' => 'products#teltest' 

  resources :products do
    resources :purchases, only: [:new, :create]
  end


  resources :users, only: [:show, :new, :create, :edit, :update ] do
    resources :deliveraddresses, only: [:new, :create]
    member do
      get 'mypage'
      get 'notification'
      get 'todo'
      get 'like'
      get 'sales'
      get 'point'
      get 'profile'
      get 'update'
      get 'card'
      get 'email_password'
      get 'purchase'
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
  
end

