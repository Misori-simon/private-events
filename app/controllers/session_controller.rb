class SessionController < ApplicationController
  def new
    @user = User.new
  end

  def log_in
    result = User.where(name: params[:user][:name])
    if result.empty?
      flash[:alert] = 'User not found.'
      redirect_to session_new_path
    else
      user = result.first
      session[:user_id] = user[:id]
      session[:user_name] = user[:name]
      redirect_to root_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
