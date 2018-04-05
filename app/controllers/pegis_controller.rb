class PegisController < ApplicationController

  before_action :authenticate_player_profile
  before_action :set_pegi, only: [:show, :update, :destroy]

  # GET /pegis
  def index
    @pegis = Pegi.paginate(page: params['page'], per_page: 15)

    render json: @pegis, each_serializer: PegiSerializer
  end

  # GET /pegis/1
  def show
    render json: @pegi, serializer: PegiSerializer
  end

  # POST /pegis
  def create
    @pegi = Pegi.new(pegi_params)

    if @pegi.save
      render json: @pegi, status: :created, location: @pegi
    else
      render json: @pegi.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pegis/1
  def update
    if @pegi.update(pegi_params)
      render json: @pegi
    else
      render json: @pegi.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pegis/1
  def destroy
    @pegi.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pegi
      @pegi = Pegi.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pegi_params
      params.fetch(:pegi, {})
    end
end
