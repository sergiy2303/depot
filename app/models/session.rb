class Session
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  attr_accessor :email, :password

  validates :email, :password, presence: true
  validate :user_session

  delegate :id, to: :user, prefix: true, allow_nil: true

  def initialize(attrs = {})
    @email = attrs[:email]
    @password = attrs[:password]
  end

  def persisted?
    false
  end

  def user
    @user ||= User.find_by(email: email)
  end

  private

  def user_session
    errors.add(:email, 'Invalid email or pass') && return unless user
    errors.add(:email, 'Invalid email or pass') unless user.authenticate(password)
  end
end
