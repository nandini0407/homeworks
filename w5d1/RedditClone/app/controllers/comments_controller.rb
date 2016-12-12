class CommentsController < ApplicationController

  before_action :require_user

  def show
    @comment = Comment.find_by_id(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    if @comment.save
      redirect_to post_url(@comment.post)
    else
      flash[:errors] = @comment.errors,full_messages
      redirect_to post_url(@comment.post)
    end
  end

  def destroy
    @comment = Comment.find_by_id(params[:id])
    post = @comment.post
    @comment.destroy
    redirect_to post_url(post)
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :content, :parent_comment_id)
  end

end
