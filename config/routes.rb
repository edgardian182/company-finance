Rails.application.routes.draw do

  root "dashboard#welcome"

  get "/users", to: "dashboard#index_user"
  get "/newuser", to: "dashboard#new_user"
  # post ""
  get "/edituser", to: "dashboard#edit_user"


  devise_for :users
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  resources :expenses
  resources :clients
  resources :orders
  resources :productions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
