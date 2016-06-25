class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to users_path
    else
      render :new
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to login_url
  end
end
