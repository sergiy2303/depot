class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :products
  validates :title, presence: true, uniqueness: true
end
