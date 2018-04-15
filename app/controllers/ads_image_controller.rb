class AdsImageController < ApplicationController


  # POST /ads_image/1
  def update
    @ad_up = Ad.find(params[:id])
    @ad_up.update_attribute(:ad_image, params[:image])
    render json: @ad_up.ad_image
  end

end
