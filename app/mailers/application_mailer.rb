class ApplicationMailer < ActionMailer::Base
  default from: "'SPairing' <spairing.un@gmail.com>"
  layout 'mailer'
  @@url = "https://spairing.herokuapp.com"
end
