class LoginsController < ApplicationController
  def new
    @users = User.all
  end

  def create
    if params[:user_id]
      session[:current_user_id] = params[:user_id]
    end
    redirect_to posts_path
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to posts_path
  end
end
