class PlayerProfileMailer < ApplicationMailer

  def welcome_email(player_profile)
    @url = @@url
    @player_profile = player_profile
    mail  to: @player_profile.email,
          subject: "Welcome to SPairing"
  end

  def request_sended_email sender, receiver
    @url = @@url
    @sender = sender
    @receiver = receiver
    mail to: @receiver.email,
         subject: "You have a friend request"
  end

  def request_accepted_email sender, receiver
    @url = @@url
    @sender = sender
    @receiver = receiver
    mail to: @receiver.email,
         subject: "You have a new friend"
  end
end
