class PlayerProfileMailer < ApplicationMailer

  def welcome_email profile
    @url = @@url
    @api = @@api
    @profile = profile
    mail  to: @profile.email,
          subject: "Welcome to SPairing"
  end

  def request_sended_email sender, receiver
    @url = @@url
    @api = @@api
    @sender = sender
    @receiver = receiver
    mail to: @receiver.email,
         subject: "You have a friend request"
  end

  def request_accepted_email sender, receiver
    @url = @@url
    @api = @@api
    @sender = sender
    @receiver = receiver
    mail to: @receiver.email,
         subject: "You have a new friend"
  end

  def update_profile profile
    @url = @@url
    @api = @@api
    @profile = profile
    mail to: @profile.email,
         subject: "Your information has been updated"
  end

end
