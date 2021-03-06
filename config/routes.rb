Rails.application.routes.draw do

  devise_for :users, path: '', path_names: {sign_in:'login',sign_out:'logout',sign_up:'register'}

  resources :pages
  resources :users
  resources :posts
  resources :items

  root to: "users#index"

end
