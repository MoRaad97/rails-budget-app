Rails.application.routes.draw do
  root 'users#index'
  devise_for :users

  resources :groups, only: %i[index new create destroy] do
    resources :entities
  end
  
  namespace :user do
    root :to => "groups#index"
  end
  get '/groups' => "groups#index", :as => :user_root
end
