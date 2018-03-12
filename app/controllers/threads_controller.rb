class ThreadsController < ApplicationController
  before_action :set_thread, only: [:show, :update, :destroy]

  # GET /threads
  def index
    @threads = Thread.all

    render json: @threads
  end

  # GET /threads/1
  def show
    render json: @thread
  end

  # POST /threads
  def create
    @thread = Thread.new(thread_params)

    if @thread.save
      render json: @thread, status: :created, location: @thread
    else
      render json: @thread.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /threads/1
  def update
    if @thread.update(thread_params)
      render json: @thread
    else
      render json: @thread.errors, status: :unprocessable_entity
    end
  end

  # DELETE /threads/1
  def destroy
    @thread.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thread
      @thread = Thread.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def thread_params
      params.fetch(:thread, {})
    end
end
