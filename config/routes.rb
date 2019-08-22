Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  get 'telltest' => 'products#teltest' 
  resources :products
  resources :users, only: :show do
    member do
      get 'index'
      get 'notification'
      get 'todo'
      get 'like'
      get 'sales'
      get 'point'
      get 'profile'
      get 'deliver_address'
      get 'card'
      get 'email_password'
      get 'purchase'
      get 'purchased'
      get 'forsell'
      get 'in_progress'
      get 'completed'
    end
  end
end
