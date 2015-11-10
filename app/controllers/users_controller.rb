class UsersController < ApplicationController
  def create
    render(:new) && return unless user.update(params.require(:user).permit!)
    EmailJob.new.async.confirmation(@user)
    flash[:notice] = 'On your email address was sent message to confirm your current address.'
  end

  def confirmation
    @user = create_user_by_token(params[:token])
    if @user
      @user.confirm!
      redirect_to root_path, notice: 'Your account has been successfully confirmed.'
    else
      redirect_to root_path, alert: 'Invalid token.'
    end
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
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    nil
  end
end
