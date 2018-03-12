class GamePlatformsController < ApplicationController
  before_action :set_game_platform, only: [:show, :update, :destroy]

  # GET /game_platforms
  def index
    @game_platforms = GamePlatform.all

    render json: @game_platforms
  end

  # GET /game_platforms/1
  def show
    render json: @game_platform
  end

  # POST /game_platforms
  def create
    @game_platform = GamePlatform.new(game_platform_params)

    if @game_platform.save
      render json: @game_platform, status: :created, location: @game_platform
    else
      render json: @game_platform.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /game_platforms/1
  def update
    if @game_platform.update(game_platform_params)
      render json: @game_platform
    else
      render json: @game_platform.errors, status: :unprocessable_entity
    end
  end

  # DELETE /game_platforms/1
  def destroy
    @game_platform.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_platform
      @game_platform = GamePlatform.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_platform_params
      params.fetch(:game_platform, {})
    end
end
