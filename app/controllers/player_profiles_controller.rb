class PlayerProfilesController < ApplicationController
  before_action :set_player_profile, only: [:show, :update, :destroy]

  # GET /player_profiles
  def index
    @player_profiles = PlayerProfile.all

    render json: @player_profiles
  end

  # GET /player_profiles/1
  def show
    render json: @player_profile
  end

  # POST /player_profiles
  def create
    @player_profile = PlayerProfile.new(player_profile_params)

    if @player_profile.save
      # Call the UserMailer to send a welcome email after save
      PlayerProfileMailer.welcome_email(@player_profile).deliver_later
      render json: @player_profile, status: :created, location: @player_profile
    else
      render json: @player_profile.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /player_profiles/1
  def update
    if @player_profile.update(player_profile_params)
      render json: @player_profile
    else
      render json: @player_profile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /player_profiles/1
  def destroy
    @player_profile.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_profile
      @player_profile = PlayerProfile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def player_profile_params
        params.require(:player_profile).permit(:pp_username, :email, :password, :location_id)
    end
end
