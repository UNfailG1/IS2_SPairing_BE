class PlayerBlackListsController < ApplicationController
  before_action :set_player_black_list, only: [:show, :update, :destroy]

  # GET /player_black_lists
  def index
    @player_black_lists = PlayerBlackList.all

    render json: @player_black_lists
  end

  # GET /player_black_lists/1
  def show
    render json: @player_black_list
  end

  # POST /player_black_lists
  def create
    @player_black_list = PlayerBlackList.new(player_black_list_params)

    if @player_black_list.save
      render json: @player_black_list, status: :created, location: @player_black_list
    else
      render json: @player_black_list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /player_black_lists/1
  def update
    if @player_black_list.update(player_black_list_params)
      render json: @player_black_list
    else
      render json: @player_black_list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /player_black_lists/1
  def destroy
    @player_black_list.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_black_list
      @player_black_list = PlayerBlackList.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def player_black_list_params
      params.fetch(:player_black_list, {})
    end
end
