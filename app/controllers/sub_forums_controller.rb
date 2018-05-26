class SubForumsController < ApplicationController

  before_action :authenticate_player_profile
  before_action :set_sub_forum, only: [:show, :update, :destroy]

  # GET /sub_forums
  def index
    @sub_forums = SubForum.getByGameId(params[:game_id])
      .paginate(page: params['page'], per_page: 15)

    render json: @sub_forums, each_serializer: SubForumSerializer
  end

  # GET /sub_forums/1
  def show
    render json: @sub_forum, serializer: SubForumSerializer
  end

  # POST /sub_forums
  def create
    @sub_forum = SubForum.new(sub_forum_params)

    if @sub_forum.save
      render json: @sub_forum, status: :created, location: @sub_forum
    else
      render json: @sub_forum.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sub_forums/1
  def update
    if @sub_forum.update(sub_forum_params)
      render json: @sub_forum
    else
      render json: @sub_forum.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sub_forums/1
  def destroy
    @sub_forum.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_forum
      @sub_forum = SubForum.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sub_forum_params
      params.fetch(:sub_forum, {})
    end
end
