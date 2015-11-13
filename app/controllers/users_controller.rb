class UsersController < ApplicationController
  before_action :require_guest, only: :new

  def create
    if user.update(params.require(:user).permit!)
      UserMailer.registration_confirmation(user, verifier.generate(user.id)).deliver_later
      flash[:success] = 'Please confirm your email address to continue'
      redirect_via_turbolinks_to root_path
    else
      render(:new)
    end
  end

  def confirm
    user = User.find(verifier.verify(params[:id]))
    user.update_column(:confirmed, true)
    flash[:success] = 'Your email has been confirmed. Please sign in to continue'
    redirect_to root_path
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to root_path
  end

  private

  def user
    @user ||= User.new
  end
  helper_method :user
end
