class UsersController < ApplicationController
  def create
    if user.update(params.require(:user).permit!)
      UserMailer.registration_confirmation(user).deliver
      flash[:success] = 'Please confirm your email address to continue'
    else
      flash[:error] = 'Ooooops, something went wrong!'
      render(:new)
    end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = 'Welcome to the Sample App! Your email has been confirmed.
      Please sign in to continue'
      redirect_to root_path
    else
      flash[:error] = 'Sorry. User does not exist'
      redirect_to root_path
    end
  end

  private

  def user
    @user ||= User.new
  end
  helper_method :user
end
