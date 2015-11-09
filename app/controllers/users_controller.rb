class UsersController < ApplicationController
  def create
    render(:new) && return unless user.update(params.require(:user).permit!)
    UserMailer.signup_confirmation(@user).deliver_later
  end

  def confirm
    @user = User.find_by_token(params[:token])
    @user.update(confirmed: true) if @user
    redirect_to root_path
  end

  private

  def user
    @user ||= User.new
  end
  helper_method :user
end
