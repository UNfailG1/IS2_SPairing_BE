class ApplicationRecordsController < ApplicationController
  before_action :set_application_record, only: [:show, :update, :destroy]

  # GET /application_records
  def index
    @application_records = ApplicationRecord.all

    render json: @application_records
  end

  # GET /application_records/1
  def show
    render json: @application_record
  end

  # POST /application_records
  def create
    @application_record = ApplicationRecord.new(application_record_params)

    if @application_record.save
      render json: @application_record, status: :created, location: @application_record
    else
      render json: @application_record.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /application_records/1
  def update
    if @application_record.update(application_record_params)
      render json: @application_record
    else
      render json: @application_record.errors, status: :unprocessable_entity
    end
  end

  # DELETE /application_records/1
  def destroy
    @application_record.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application_record
      @application_record = ApplicationRecord.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def application_record_params
      params.fetch(:application_record, {})
    end
end
