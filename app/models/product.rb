class Product < ActiveRecord::Base
  belongs_to :category
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  scope :by_category, -> (id) { where(category_id: id) if id }
  scope :search, -> (name) { where('name ILIKE :q OR description ILIKE :q', q: "%#{name}%") if name }
  scope :awesome, -> (params) { search(params[:search]).by_category(params[:category]).page(params[:page]).per(8) }

  mount_uploader :image, ImageUploader
end
