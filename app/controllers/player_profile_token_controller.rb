class PlayerProfileTokenController < Knock::AuthTokenController

  #Adding response of the id of the user to be logged
  def create
    @player_id = PlayerProfile.getFirstByEmail(params[:auth][:email]).id
    render json: {
        jwt: auth_token.token,
        user_id: @player_id
      }, status: :created
  end

end
