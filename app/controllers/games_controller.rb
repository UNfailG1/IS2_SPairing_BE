class GamesController < ApplicationController

  before_action :authenticate_player_profile
  before_action :set_game, only: [:update, :destroy]
  #before_action :set_game, only: %i[show update destroy]

  # GET /games
  def index
    if params['name'] == nil
      @games = Game.paginate(page: params['page'], per_page: 10)
    else
      @games = Game.getByNameLike(params['name'])
    end
    render json: @games, each_serializer: GameSerializer
  end

  # GET /games/1
  def show
    if Game.exists?(params[:id])
      @game = Game.find(params[:id])
    else
      @game = GameGetter.createGame(params[:id])
    end
    render json: @game, serializer: GameSerializer
    @game.update_attribute(:gam_views, @game.gam_views + 1)
  end

  # POST /games
  def create
    @game = Game.new(game_params)

    if @game.save
      render json: @game, status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
  end

  def gameslike
    games = Game.getByNameLike(params['gam_name']).paginate(page: params['page'], per_page: 15)
    render json: games, status: :ok, each_serializer: GameSearchSerializer
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def game_params
    params.fetch(:game, {})
  end
end
