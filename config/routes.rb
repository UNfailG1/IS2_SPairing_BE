Rails.application.routes.draw do

  post "player_profile_token" => "player_profile_token#create"
  post "google_authentication" => "social_auth#google_authentication"

  resources :sponsors do
    resources :ads, shallow: true
  end

  resources :games do
   resources :sub_forums, only: [:index, :create] do
     resources :thread_forums, only: [:index, :create] do
       resources :comments, only: [:index, :create]
     end
   end
  end

  resources :sub_forums, :thread_forums, :comments, only: [:show, :update, :destroy]

  resources :ads_image, only: [:update]
  resources :player_profiles_avatar, only: [:update]

  resources :player_profiles, shallow: true do
    resources :player_game_profiles
  end

  resources :genres, :locations, :pegis, :platforms, :mailboxes, :reports,
            :statistics, :player_games, :tags

  get "/friend_request/:receiver_id" => "player_profiles#friend_request"
  get "/remove_friend/:receiver_id" => "player_profiles#remove_friend"
  get "/usernames_like" => "player_profiles#usernames_like"
  get "/games_like" => "games#games_like"
  get "/suggested_profiles" => "player_profiles#suggested_profiles"
  get "/friend_status/:receiver_id" => "player_profiles#friend_status"
  get "/block_player/:blocked_player_id" => "player_profiles#block_player"
  get "/blocked_status/:player_id" => "player_profiles#block_status" 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
