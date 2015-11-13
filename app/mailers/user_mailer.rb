class UserMailer < ActionMailer::Base
  default from: 'support@geekhub.com'
  def registration_confirmation(user, token)
    @token = token
    mail(to: user.email, subject: 'Registration Confirmation')
  end
end
