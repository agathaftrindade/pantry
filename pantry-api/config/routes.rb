Rails.application.routes.draw do

  resources :products

  resources :brands

  resources :purchases do
    resources :purchase_products, path: 'items'
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
