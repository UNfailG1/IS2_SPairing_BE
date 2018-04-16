require httparty

class PlayerProfileTokenController < Knock::AuthTokenController
  include HTTParty
  
  def google_authentication
    token = params["id_token"]
    response = HTTParty.get('https://www.googleapis.com/oauth2/v3/tokeninfo?id_token=#{token}')
    
    puts response
    puts response.parsed_response
  end
  
  
  
end
