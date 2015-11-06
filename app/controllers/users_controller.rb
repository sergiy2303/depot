class UsersController < ApplicationController
  def create
    render(:new) and return unless user.update(params.require(:user).permit!)
    EmailJob.new.async.perform(@user)
  end

  def confirmation
    @user = create_user_by_token(params[:token])
    @user.confirm!
    redirect_to root_path
  end

  private

  def user
    @user ||= User.new
  end
  helper_method :user

  def create_user_by_token(token)
    verifier = ActiveSupport::MessageVerifier.new(Rails.application.secrets[:secret_key_base])
    user_id = verifier.verify(token)
    User.find(user_id[:user_id])
  end
end
