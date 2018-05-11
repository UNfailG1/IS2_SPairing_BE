class ScreenshotsController < ApplicationController
  before_action :set_screenshot, only: [:show, :update, :destroy]

  # GET /screenshots
  def index
    @screenshots = Screenshot.all

    render json: @screenshots
  end

  # GET /screenshots/1
  def show
    render json: @screenshot
  end

  # POST /screenshots
  def create
    @screenshot = Screenshot.new(screenshot_params)

    if @screenshot.save
      render json: @screenshot, status: :created, location: @screenshot
    else
      render json: @screenshot.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /screenshots/1
  def update
    if @screenshot.update(screenshot_params)
      render json: @screenshot
    else
      render json: @screenshot.errors, status: :unprocessable_entity
    end
  end

  # DELETE /screenshots/1
  def destroy
    @screenshot.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_screenshot
      @screenshot = Screenshot.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def screenshot_params
      params.require(:screenshot).permit(:scr_url, :scr_height, :scr_width, :game_id)
    end
end
