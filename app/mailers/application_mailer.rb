class ApplicationMailer < ActionMailer::Base
  default from: "spam@example.com"
  layout 'mailer'
end
