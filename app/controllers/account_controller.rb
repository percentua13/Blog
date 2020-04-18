require 'bcrypt'
class AccountController < ApplicationController
  def create
  end

  def store
    default_avatar_url = "https://res.cloudinary.com/doxgbchiu/image/upload/v1587117423/78-785878_batman-icon-batman-avatar-icon-hd-png-download_xlej1p.png"

    @user = Author.new(:name => params[:name], :surname => params[:surname], :username => "@"+params[:username], :email => params[:email], :password_ => params[:password], :about => params[:about], :media => default_avatar_url)

    @user.save

    redirect_to('/post/myposts')
  end

  def info
    @user = Author.find_by(id: params[:id])
  end

  def update
    if (session[:user_id]==nil)
      redirect_to('/login')
    end
  end

  def updatesave
    if (session[:user_id]==nil)
      redirect_to('/login')
    end

    @userToChange = Author.find_by(id: session[:user_id])


    @userToChange.name = params[:name]== "" ? @userToChange.name : params[:name]
    @userToChange.surname = params[:surname]  == "" ? @userToChange.surname : params[:surname]
    @userToChange.password = params[:password] == "" ? @userToChange.password : params[:password]
    @userToChange.about = params[:about]  == "" ? @userToChange.about : params[:about]
    @userToChange.media = params[:media]  == nil ? @userToChange.media : Cloudinary::Uploader.upload(params[:media])['secure_url']


    @userToChange.save

    session[:user_name] = @userToChange.name

    redirect_to('/account/info/'+session[:user_id].to_s)
  end

  def find

    if (params[:name][0].to_s != "@")
    @users = Author.where(:name => params[:name]).all
    else
      @users = Author.where(:username => params[:name]).all
     end
  end
end
