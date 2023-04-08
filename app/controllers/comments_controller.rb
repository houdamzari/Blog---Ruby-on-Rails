class CommentsController < ApplicationController
  before_action :set_post, only: [:create]

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new(user: @user, post: @post, text: params[:comment][:text])
  if @comment.save
      redirect_to post_path(@comment.post)
    else
      @article = Post.find(params[:post_id])
      redirect_to post_path(@post)
    end

  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

  def on_comment_create_success
    flash[:notice] = 'Comment added successfully!'
    @comment.update_comments_counter
    redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id])
  end

  def on_comment_create_failure
    flash[:alert] = "Couldn't add Comment!"
    render :new, status: :unprocessable_entity
  end
end
