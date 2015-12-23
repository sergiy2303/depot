class Order < ActiveRecord::Base
  has_many :products, class_name: 'OrderProduct'

  accepts_nested_attributes_for :products
  validates :email, presence: true, format: {
    with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
    message: 'Invalid email format'
  }
  validates :phone, presence: true, length: { is: 10 }
  validates :address, presence: true

  before_save :cal_total

  private

  def cal_total
    res = products.map do |product|
      product.quantity * product.product.price.to_f
    end
    self.total = res.sum
  end
end
