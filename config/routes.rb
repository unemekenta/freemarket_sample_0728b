Rails.application.routes.draw do
  get 'products/index'
  get 'products/pay'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  get 'telltest' => 'products#teltest' 
  resources :products
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
    end
  end
end
