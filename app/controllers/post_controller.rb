class PostController < ApplicationController

  def myposts
    if session[:user_id] == nil
      redirect_to('/login')
    end

    @posts = Post.joins(:author).where(author_id: session[:user_id]).all.order(id: :desc)
  end

  def all_posts_of_selected_user
    if session[:user_id] == nil
      redirect_to('/login')
    end

    @posts = Post.joins(:author).where(author_id:  params[:id]).all.order(id: :desc)
  end

  def post

  end

  def currentpost
    @post = Post.joins(:author).joins(:post2tags).find_by(id: params[:id])
    @comments = Comment.joins(:author).where(post_id: params[:id]).all
  end


  def create
    if (session[:user_id]==nil)
      redirect_to('/home/index')
    end

  end

  def store
    # upload image to cloudinary
    @image =  Cloudinary::Uploader.upload(params[:media])
    # create a new post object and save to db
    @post = Post.new(:body => params[:body], :dateTime => Time.now,  :author_id => session[:user_id],  :media => @image['secure_url'])

    @post.save

    tags = params[:tags].split(' ');

    if (tags != nil)
      tags.each do |tag|
        if (tag[0].to_s == "#")

          if_tag_exist =  Tag.find_by(id: tag) != nil
          if (if_tag_exist == false)
            @tag = Tag.new(:id => tag)
            @tag.save
          end

          @post_2_tag =  Post2tag.new(:tag_id => tag, :post_id => @post.id)
          @post_2_tag.save
        end
      end
    end

    redirect_to('/post/myposts')
  end


  def find_by_tag

    if(params[:tag].to_s != "")
      @tag = params[:tag].to_s
    else
      @tag = "#"+params[:id].to_s
    end

    @posts = Post.joins(:author).joins(:post2tags).where(post2tags: {tag_id:  @tag }).all.order(id: :desc)
  end



end
