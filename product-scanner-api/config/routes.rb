Rails.application.routes.draw do
  resources :purchase_products
  resources :products
  resources :brands
  resources :purchases
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
