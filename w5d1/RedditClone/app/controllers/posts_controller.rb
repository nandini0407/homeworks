class PostsController < ApplicationController

  before_action :require_user

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  def new
    @post = Post.new
    @subs = Sub.all
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      @subs = Sub.all
      render :new
    end
  end

  def edit
    @post = Post.find_by_id(params[:id])
    @subs = Sub.all
  end

  def update
    @post = Post.find_by_id(params[:id])
    if @post.author_id != current_user.id
      flash[:errors] = ["can only edit your own post"]
      redirect_to post_url(@post)
    elsif @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      @subs = Sub.all
      render :edit
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    if @post.author_id != current_user.id
      flash[:errors] = ["can only delete your own post"]
      redirect_to post_url(@post)
    else
      @post.destroy
      redirect_to posts_url
    end
  end

  def post_params
    params.require(:post).permit(:title, :content, :url, sub_ids: [])
  end

end
