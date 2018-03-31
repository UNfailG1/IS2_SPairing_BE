Rails.application.routes.draw do
  post 'player_profile_token' => 'player_profile_token#create'
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
