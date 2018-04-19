class PlayerProfilesAvatarController < ApplicationController

  # POST /player_profile_avatar/1
  def update
    @pp_up = PlayerProfile.find(params[:id])
    @pp_up.update_attribute(:pp_avatar, params[:image])
    render json: @pp_up.pp_avatar
  end

end
