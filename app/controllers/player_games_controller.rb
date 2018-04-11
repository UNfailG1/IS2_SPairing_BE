class PlayerGamesController < ApplicationController
  before_action :set_player_game, only: %i[show update destroy]

  # GET /player_games/
  def index
    @player_game = PlayerGameProfile.getPlayerGameProfileByPlayerProfileIdAndGameId(params[:pid], params[:gid])
    render json: @player_game
  end
  
end
