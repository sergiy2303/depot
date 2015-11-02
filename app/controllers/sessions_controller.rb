class SessionsController < ApplicationController
  def new
  end

  def create
    @session = Session.new(params[:session])
    if @session.valid?
      session[:user_id] = @session.user_id
    else
      render :new
    end
  end

  def destroy
    reset_session
  end
end
