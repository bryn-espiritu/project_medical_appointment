Rails.application.routes.draw do
  resources :appointments do
  resources :notes, except: :show

   root "appointments#index"

end
  devise_for :users
  end