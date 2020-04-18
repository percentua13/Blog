class HomeController < ApplicationController
  def index
    #@posts = Post.order(id: :desc).all

      #.where(id: session[:user_id]).order(id: :desc)
  end
end
