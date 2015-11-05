class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: /@/

  def confirm!
    self.confirmed = true
    self.save
  end
end
