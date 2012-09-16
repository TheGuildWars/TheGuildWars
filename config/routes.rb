TheGuildWars::Application.routes.draw do
  # Devise
  devise_for :users
  # Matchers
  match "/about" => "static#about", as: :about
  match "/access_denied" => "static#error401", as: :access_denied
  match "/users/:user_id/set_world/:world_id" => "users#set_world"
  # Resources
  resources :articles
  resources :guilds
  resources :regions
  resources :users
  resources :worlds
  # Root
  root to: 'static#home'
end
