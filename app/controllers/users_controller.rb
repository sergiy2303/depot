class UsersController < ApplicationController
  def create
    render(:new) && return unless user.update(params.require(:user).permit!)
    UserMailer.signup_confirmation(@user).deliver_later
  end

  def confirm
    verifier = ActiveSupport::MessageVerifier.new(Rails.application.secrets.user_confirmation_base)
    message = verifier.verify(params[:message])
    @user = User.find_by_id(message[:id])
    @user.confirmed = true
    @user.save
    redirect_to root_path
  end

  private

  def user
    @user ||= User.new
  end
  helper_method :user
end
