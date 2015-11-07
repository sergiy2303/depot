class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: /@/

  def confirm!
    self.confirmed = true
    self.save
  end

  def send_instructions!
    UserMailer.welcome_email(self).deliver_now!
  end

  def create_token
    verifier = ActiveSupport::MessageVerifier.new(Rails.application.secrets[:secret_key_base])
    verifier.generate(user_id: self.id)
  end
end
