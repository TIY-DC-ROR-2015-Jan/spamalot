class SpamMailer < ApplicationMailer
  #def welcome_email(user)
  #  @user = user
  #  @url  = 'http://example.com/login'
  #  mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  #end
  def spam_aggregate user
    mail to: user.email, subject: "Recent spams"
    # Render template(s) in app/views/spam_mailer/spam_aggregate.(html|text).slim
  end

  def spam_blast
    mail to: User.pluck(:email), subject: "Check this out!"
  end
end
