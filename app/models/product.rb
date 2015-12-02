class Product < ActiveRecord::Base
  belongs_to :category
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  scope :by_category, -> (slug) { joins(:category).where('categories.slug = ?', slug) if slug }
  scope :search, -> (name) { where('name ILIKE :q OR description ILIKE :q', q: "%#{name}%") if name }
  scope :awesome, -> (params) { search(params[:search]).by_category(params[:slug]).page(params[:page]).per(8) }

  mount_uploader :image, ImageUploader
end
