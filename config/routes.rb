Rails.application.routes.draw do
  devise_for :users

  post 'registrar' => 'home#create', :as => 'pre_register'
  
  root 'home#index'
end
