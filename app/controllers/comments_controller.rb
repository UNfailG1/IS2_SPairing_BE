class CommentsController < ApplicationController

  before_action :authenticate_player_profile
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /comments
  def index
    @comments = Comment.paginate(page: params['page'], per_page: 15)

    render json: @comments, each_serializer: CommentSerializer
  end

  # GET /comments/1
  def show
    render json: @comment, serializer: CommentSerializer
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @comment
      @comment.thread_forum.update_attribute(:thr_comments, @comment.thread_forum.thr_comments + 1)
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params[:comment].permit(:com_comment, :thread_forum_id, :player_profile_id)
    end
end
