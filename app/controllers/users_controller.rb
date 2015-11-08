class UsersController < ApplicationController
  def create
    render(:new) && return unless user.update(params.require(:user).permit!)
    UserMailer.signup_confirmation(@user).deliver_later
  end

  private

  def user
    @user ||= User.new
  end
  helper_method :user
end
