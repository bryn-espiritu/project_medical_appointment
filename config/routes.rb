Rails.application.routes.draw do
  resources :appointments do
  resources :notes, except: :show

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "appointments#index"

end
  devise_for :users
  end