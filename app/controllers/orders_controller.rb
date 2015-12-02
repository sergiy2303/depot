class OrdersController < ApplicationController
  def create
    session[:products] ||= []
    flash[:success] = 'Added'
    return if session[:products].include? params[:id]
    session[:products] << params[:id]
  end

  def destroy
  end
end
