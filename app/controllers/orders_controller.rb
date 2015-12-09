class OrdersController < ApplicationController
  def create
    session[:products] ||= {}
    return if can_add_order?
    session[:products].merge!(params[:id] => params[:quantity])
  end

  def destroy
  end

  private

  def can_add_order?
    session[:products].keys.include?(params[:id]) || params[:quantity].to_i < 1
  end
end
