class PlayerGameProfilesController < ApplicationController

  before_action :authenticate_player_profile
  before_action :set_player_game_profile, only: [:show, :update, :destroy]

  # GET /player_game_profiles
  def index
    @player_game_profiles = PlayerGameProfile.getByPlayerId(params[:player_profile_id])
      .paginate(page: params['page'], per_page: 15)

    render json: @player_game_profiles, each_serializer: PlayerGameProfileSerializer
  end

  # GET /player_game_profiles/1
  def show
    render json: @player_game_profile, serializer: PlayerGameProfileSerializer
  end

  # POST /player_game_profiles
  def create
    @player_game_profile = PlayerGameProfile.new(
      player_game_profile_params.merge({
        player_profile_id: params[:player_profile_id]
      }))

    if @player_game_profile.save
      UpdateGameRateJob.perform_later(@player_game_profile)
      render json: @player_game_profile, status: :created, location: @player_game_profile
    else
      render json: @player_game_profile.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /player_game_profiles/1
  def update
    if @player_game_profile.update(player_game_profile_params)
      render json: @player_game_profile
    else
      render json: @player_game_profile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /player_game_profiles/1
  def destroy
    @player_game_profile.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_game_profile
      @player_game_profile = PlayerGameProfile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def player_game_profile_params
      params.require(:player_game_profile).permit(:game_id, :pgp_nickname, :pgp_reputation)
    end
end
