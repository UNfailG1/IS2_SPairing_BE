class UpdateGameRateJob < ApplicationJob
  queue_as :default

  def perform(game)
    if(game.player_game_profiles.count == 0)
      return
    end
    actual_gam_rate_players = 0
    game.player_game_profiles.each{ |player_game_profile|
      actual_gam_rate_players += player_game_profile.pgp_rate
    }
    game.update_attribute(:gam_rate_players, actual_gam_rate_players/game.player_game_profiles.count)
  end
end
