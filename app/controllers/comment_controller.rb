class CommentController < ApplicationController
  def create
  end

  def store
    if (session[:user_id]==nil)
      redirect_to('/login')
    end

    @comment = Comment.new(:body => params[:body], :dateTime => Time.now, :author_id => session[:user_id], :post_id => params[:id])
    #@user = Author.new(:name => params[:name], :email => params[:email], :password => params[:password], :about => params[:about], :media => default_avatar_url)

    @comment.save

    redirect_to('/post/'+params[:id])
  end
end
