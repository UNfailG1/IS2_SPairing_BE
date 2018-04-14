class AdsImageController < ApplicationController

  
  # POST /ads_image/1
  def update
    @ad_up = Ad.find(params[:id])
    @ad_up.ad_image = params[:image]
    @ad_up.save
    render json: @ad_up
  end

end
