class PlayerReportsController < ApplicationController

  before_action :authenticate_player_profile
  before_action :set_player_report, only: [:show, :update, :destroy]

  # GET /player_reports
  def index
    @player_reports = PlayerReport.all

    render json: @player_reports
  end

  # GET /player_reports/1
  def show
    render json: @player_report
  end

  # POST /player_reports
  def create
    @player_report = PlayerReport.new(player_report_params)

    if @player_report.save
      render json: @player_report, status: :created, location: @player_report
    else
      render json: @player_report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /player_reports/1
  def update
    if @player_report.update(player_report_params)
      render json: @player_report
    else
      render json: @player_report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /player_reports/1
  def destroy
    @player_report.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_report
      @player_report = PlayerReport.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def player_report_params
      params.fetch(:player_report, {})
    end
end
