class SponsorsController < ApplicationController

  before_action :set_sponsor, only: [:show, :update, :destroy]

  # GET /sponsors
  def index
    @sponsors = Sponsor.all

    render json: @sponsors
  end

  # GET /sponsors/1
  def show
    render json: @sponsor
  end

  # POST /sponsors
  def create
    @sponsor = Sponsor.new(sponsor_params)

    if @sponsor.save
      render json: @sponsor, status: :created, location: @sponsor
    else
      render json: @sponsor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sponsors/1
  def update
    if @sponsor.update(sponsor_params)
      render json: @sponsor
    else
      render json: @sponsor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sponsors/1
  def destroy
    @sponsor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sponsor
      @sponsor = Sponsor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sponsor_params
      params.fetch(:sponsor, {})
    end
end
