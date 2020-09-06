class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.new(nickname: params[:user][:nickname])
    if @user.save
      session[:user_id] = user.id
      redirect_to user
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end
end
