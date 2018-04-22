class ApplicationMailer < ActionMailer::Base
  default from: "'SPairing' <spairing.un@gmail.com>"
  layout 'mailer'
  @@url = "https://spairing.herokuapp.com"
  @@api = "https://spairing-api.herokuapp.com"
end
