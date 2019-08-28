Rails.application.routes.draw do
  get 'products/index'
  get 'products/pay'
  devise_for :users, controllers: { registrations: "users", sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  get 'telltest' => 'products#teltest' 
  resources :products
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
  
end

