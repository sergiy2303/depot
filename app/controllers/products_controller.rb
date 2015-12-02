class ProductsController < ApplicationController
  before_action :require_guest
  expose(:products) { |default| default.awesome(params) }
  expose(:product)
end
