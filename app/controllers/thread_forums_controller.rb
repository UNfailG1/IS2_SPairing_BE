class ThreadForumsController < ApplicationController

  before_action :authenticate_player_profile
  before_action :set_thread_forum, only: [:show, :update, :destroy]

  # GET /thread_forums
  def index
    @thread_forums = ThreadForum.paginate(page: params['page'], per_page: 15)

    render json: @thread_forums, each_serializer: ThreadForumSerializer
  end

  # GET /thread_forums/1
  def show
    render json: @thread_forum, serializer: ThreadForumSerializer
  end

  # POST /thread_forums
  def create
    @thread_forum = ThreadForum.new(thread_forum_params)

    if @thread_forum.save
      render json: @thread_forum, status: :created, location: @thread_forum
    else
      render json: @thread_forum.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /thread_forums/1
  def update
    if @thread_forum.update(thread_forum_params)
      render json: @thread_forum
    else
      render json: @thread_forum.errors, status: :unprocessable_entity
    end
  end

  # DELETE /thread_forums/1
  def destroy
    @thread_forum.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thread_forum
      @thread_forum = ThreadForum.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def thread_forum_params
      params.fetch(:thread_forum, {})
    end
end
