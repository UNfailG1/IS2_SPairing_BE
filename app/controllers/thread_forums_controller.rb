class ThreadForumsController < ApplicationController

  # before_action :authenticate_player_profile
  before_action :set_thread_forum, only: [:show, :update, :destroy]

  # GET /thread_forums
  def index
    @thread_forums = ThreadForum.getBySubForumId(params[:sub_forum_id])
      .paginate(page: params['page'], per_page: 15)

    render json: @thread_forums, each_serializer: ThreadForumSerializer
  end

  # GET /thread_forums/1
  def show
    render json: @thread_forum, serializer: ThreadForumSerializer
    @thread_forum.update_attribute(:thr_views, @thread_forum.thr_views + 1)
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
      params[:thread_forum].permit(:thr_name, :sub_forum_id, :thr_comments, :thr_views)
    end
end
