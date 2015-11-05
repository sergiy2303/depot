class UserMailer < ApplicationMailer
  include Rails.application.routes.url_helpers
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    @url  = 'localhost:3000'
    @activation_link = create_activation_link(@user.id)
    mail(to: @user.email, subject: 'Welcome to my site. Hope yoou enjoy it')
  end

  private

  def create_activation_link(id)
    verifier = ActiveSupport::MessageVerifier.new(Rails.application.secrets[:secret_key_base])
    token = verifier.generate(user_id: id)
    "#{root_url}user/confirmation?token=#{token}"
  end

  helper_method :create_activation_link
end
