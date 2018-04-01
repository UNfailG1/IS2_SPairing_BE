class PlayerProfileMailer < ApplicationMailer

  def welcome_email(player_profile)
    @url = "http://spairing.herokuapp.com/"
    @player_profile = player_profile
    mail  to: @player_profile.email,
          subject: "Welcome to SPairing"
  end
end
