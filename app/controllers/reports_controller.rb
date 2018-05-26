class ReportsController < ApplicationController

  before_action :authenticate_player_profile
  before_action :set_report, only: [:show, :update, :destroy]

  # GET /reports
  def index
    @reports = Report.reports

    render json: @reports
  end

  # GET /reports/1
  def show
    render json: @report
  end

  # POST /reports
  def create
    @report = Report.new
    options = report_params

    case options[:type]
    when "Ad"
      @report.report_type = "Ad"
      if options[:id] == 0
        @report.link = AdReporter.createAdCollectReport Ad.all, 'all'
      else
        @report.link = AdReporter.createAdReport Ad.find(options[:id])
      end
      @report.filename = @report.link.split('/')[2]
    when "PlayerProfile"
      @report.report_type = "PlayerProfile"
      if options[:id] == 0
        @report.link = PlayerProfileReporter.createPlayerProfileCollectReport PlayerProfile.all, 'all'
      else
        @report.link = PlayerProfileReporter.createPlayerProfileReport PlayerProfile.find(options[:id])
      end
      @report.filename = @report.link.split('/')[2]
    end

    if @report.save
      render json: @report, status: :created
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reports/1
  def update
    if @report.update(report_params)
      render json: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reports/1
  def destroy
    @report.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def report_params
      params.require(:report).permit(:type, :id)
    end
end
