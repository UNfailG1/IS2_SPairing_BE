class ValidateSessionController < ApplicationController

  def validate
    if current_player_profile
      render json: { user_id: current_player_profile.id }, status: :ok
    else
      render plain: 'Unauthorized', status: :unauthorized
    end
  end

end
