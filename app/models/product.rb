class Product < ActiveRecord::Base
  belongs_to :category
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  scope :by_category, -> (id) do
    category_id = Category.where(slug: id).first.id if id
    where(category_id: category_id) if category_id
  end
  scope :search, -> (name) { where('name ILIKE :q OR description ILIKE :q', q: "%#{name}%") if name }
  scope :awesome, -> (params) { search(params[:search]).by_category(params[:id]).page(params[:page]).per(8) }

  mount_uploader :image, ImageUploader
end
