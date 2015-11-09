class UserMailer < ApplicationMailer
  default from: 'geekhub.depot@gmail.com'

  def signup_confirmation(user)
    verifier = ActiveSupport::MessageVerifier.new(Rails.application.secrets.user_confirmation_base)
    @user = user
    message = verifier.generate(id: @user.id)
    @link = "#{root_url}user/confirm?message=#{message}"
    mail to: @user.email, subject: 'Sign up confirmation'
  end
end
