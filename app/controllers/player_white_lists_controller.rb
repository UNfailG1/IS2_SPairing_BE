class PlayerWhiteListsController < ApplicationController
  before_action :set_player_white_list, only: [:show, :update, :destroy]

  # GET /player_white_lists
  def index
    @player_white_lists = PlayerWhiteList.all

    render json: @player_white_lists
  end

  # GET /player_white_lists/1
  def show
    render json: @player_white_list
  end

  # POST /player_white_lists
  def create
    @player_white_list = PlayerWhiteList.new(player_white_list_params)

    if @player_white_list.save
      render json: @player_white_list, status: :created, location: @player_white_list
    else
      render json: @player_white_list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /player_white_lists/1
  def update
    if @player_white_list.update(player_white_list_params)
      render json: @player_white_list
    else
      render json: @player_white_list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /player_white_lists/1
  def destroy
    @player_white_list.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_white_list
      @player_white_list = PlayerWhiteList.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def player_white_list_params
      params.fetch(:player_white_list, {})
    end
end
