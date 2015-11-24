class Product < ActiveRecord::Base
  belongs_to :category
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  scope :contain, -> (name) { where('name ILIKE?', "%#{name}%") }

  mount_uploader :image, ImageUploader
end
