class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(user_session_params)

    if @user_session.save
      redirect_to users_path
    else
      render :new
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to login_path
  end

  private

  # FIXME: https://github.com/binarylogic/authlogic/issues/487
  def user_session_params
    params.require(:user_session).permit(:username, :password).to_h
  end
end
