class WelcomeController < ApplicationController
  before_action :require_guest
  expose(:categories) { |default| default.joins(:products).group(:id) }
  expose(:products) { |default| default.awesome(params) }
end
