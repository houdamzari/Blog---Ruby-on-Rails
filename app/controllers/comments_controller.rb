class CommentsController < ApplicationController
  before_action :set_post, only: [:create]

  def new
    @comment = Comment.new
    @user = User.where(id: @comment.user_id)
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.user = current_user
    @comment.post = @post

    if @comment.save
      on_comment_create_success
    else
      on_comment_create_failure
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
