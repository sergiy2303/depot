class OrdersController < ApplicationController
  def create
    session[:products] ||= {}
    return if session[:products].keys.include?(params[:id]) || params[:quantity].to_i < 1
    session[:products].merge!(params[:id] => params[:quantity])
  end

  def destroy
  end
end
