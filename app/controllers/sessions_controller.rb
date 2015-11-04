class SessionsController < ApplicationController
  def create
    if user_session.valid?
      session[:user_id] = user_session.user_id
    else
      render :new
    end
  end

  def destroy
    reset_session
  end

  private

  def user_session
    @session ||= Session.new(params[:session] || {})
  end
  helper_method :user_session
end
