class SessionController < ApplicationController
  def new
  end

  def create
    #get the user with this email address
    # if the passwords match
    # remember this user in the session hash
    # redirect to the homepage
    #else
    # redirect to the login page
    user = User.find_by :email => params[:email]
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Invalid login or password"
      redirect_to login_path
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
