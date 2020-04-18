require 'bcrypt'
class SessionsController < ApplicationController
  def new
  end
  def create
    user = Author.find_by(email: params[:email])

    if user && user.password_ == params[:password]
      session[:user_id] = user.id
      session[:user_name] = user.name
      redirect_to('/account/info/'+session[:user_id].to_s)

    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end
  def destroy
    session[:user_id] = nil
    session[:user_name] = nil
    redirect_to root_url, notice: "Logged out!"
    end
end
