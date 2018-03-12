Rails.application.routes.draw do
  resources :thread_forums
  resources :sub_forums
  resources :sponsors
  resources :ratings
  resources :player_white_lists
  resources :player_game_profiles
  resources :player_black_lists
  resources :platforms
  resources :pegis
  resources :mailboxes
  resources :locations
  resources :genres
  resources :game_platforms
  resources :games
  resources :comments
  resources :attachments
  resources :application_records
  resources :player_profiles
  resources :ads
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
