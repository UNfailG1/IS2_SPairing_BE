Rails.application.routes.draw do

  resources :player_games
  post "player_profile_token" => "player_profile_token#create"

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

  resources :player_profiles, shallow: true do
    resources :mailboxes
    resources :player_game_profiles
  end

  resources :genres, :locations, :pegis, :platforms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
