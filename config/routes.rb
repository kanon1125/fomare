Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tweets do 
    resources :likes, only: [:create, :destroy]
  end
  root "top#index"
  
end
