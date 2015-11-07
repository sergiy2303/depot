class UserMailer < ApplicationMailer
  include Rails.application.routes.url_helpers
  default from: 'depotcom1@gmail.com'

  def welcome_email(user)
    @user = user
    @activation_link = create_activation_link(@user.create_token)
    mail(to: @user.email, subject: 'Plase confirm your email')
  end

  private

  def create_activation_link(token)
    "#{root_url}user/confirmation?token=#{token}"
  end
end
