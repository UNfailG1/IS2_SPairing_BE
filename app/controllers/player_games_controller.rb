class PlayerGamesController < ApplicationController
  before_action :authenticate_player_profile
  before_action :set_player_game, only: %i[show update destroy]

  # GET /player_games/
  def index
    if params.keys.size != 4 || !params.has_key?(:pid) || !params.has_key?(:gid)
      render :json => {error: 'Wrong request. There must be 2 params: pid and gid'}, :status => 400
    else
      @player_game = PlayerGameProfile.getPlayerGameProfileByPlayerProfileIdAndGameId(params[:pid], params[:gid])
      if @player_game == nil
        render :json => {error: "Player game profile wasn't found"}, :status => 404
      else
        render json: @player_game
      end
    end
  end
end
