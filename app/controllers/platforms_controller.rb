class PlatformsController < ApplicationController
  before_action :set_platform, only: [:show, :update, :destroy]

  # GET /platforms
  def index
    @platforms = Platform.all

    render json: @platforms
  end

  # GET /platforms/1
  def show
    render json: @platform
  end

  # POST /platforms
  def create
    @platform = Platform.new(platform_params)

    if @platform.save
      render json: @platform, status: :created, location: @platform
    else
      render json: @platform.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /platforms/1
  def update
    if @platform.update(platform_params)
      render json: @platform
    else
      render json: @platform.errors, status: :unprocessable_entity
    end
  end

  # DELETE /platforms/1
  def destroy
    @platform.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_platform
      @platform = Platform.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def platform_params
      params.fetch(:platform, {})
    end
end
