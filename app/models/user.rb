class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: /@/

  def confirmation_token
    User.create_confirmation_token(self)
  end

  def self.verifier
    ActiveSupport::MessageVerifier.new(Rails.application.secrets.user_confirmation_base)
  end

  def self.create_confirmation_token(user)
    verifier.generate(id: user.id)
  end

  def self.find_by_token(token)
    message = verifier.verify(token)
    User.find_by_id(message[:id])
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    nil
  end
end
