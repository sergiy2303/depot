class Category < ActiveRecord::Base
  has_many :products
  validates :title, presence: true, uniqueness: true
  before_save :to_slug

  def to_param
    slug
  end

  private

  def to_slug
    self.slug = title.parameterize
  end
end
