Rails.application.routes.draw do
  resources :ads
  resources :comments
  resources :games
  resources :genres
  resources :locations
  resources :mailboxes
  resources :pegis
  resources :platforms
  resources :player_game_profiles
  resources :player_profiles
  resources :sponsors
  resources :sub_forums
  resources :thread_forums

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
