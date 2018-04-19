require 'httparty'
require 'json'

class SocialAuthController < ApplicationController
  include HTTParty

  def google_authentication
    url = "https://www.googleapis.com/oauth2/v3/tokeninfo?id_token=#{params[:id_token]}"
    response = HTTParty.get(url)
    respone = response.parsed_response
    if Time.at(response["exp"].to_i) > Time.now
      if response["iss"].eql?("accounts.google.com") || reponse["iss"].eql?("https://accounts.google.com")
        @player_profile = PlayerProfile.create_user_for_google(response.parsed_response)
        token = { jwt: Knock::AuthToken.new(payload: { sub: @player_profile.id }).token }
        render json: token
      end
    else
      # Pendiente por revisar el status
      render json: {}, status: 401
    end
  end
end
