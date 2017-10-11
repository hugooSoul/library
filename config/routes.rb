Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'library#index'

  devise_for :users, :controllers => {
    :registrations => "users/registrations"
  }

  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user

  resources :books

  resources :admin, only: [:index]

  resources :categories
  get 'categories_admin', :to => 'categories#home', :as => :admin_category
  get 'users_admin', :to => 'admin#show_users', :as => :admin_users

  mount ActionCable.server => '/cable'

end
