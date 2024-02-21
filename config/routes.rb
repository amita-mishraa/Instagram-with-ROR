Rails.application.routes.draw do
   # root ''
   root 'dashboard#index'
   get 'sessions', to: 'sessions#new'
   post 'sessions', to: 'sessions#create'
   get 'homes', to: 'homes#index'
   get 'forhomee', to: 'forhomes#index'
   resources :users do
   resources :profiles
   end 
end
