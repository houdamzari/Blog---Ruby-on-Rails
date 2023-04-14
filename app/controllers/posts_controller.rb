load_and_authorize_resource
class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = Post.includes(:comments).where(author_id: @user.id)
    @user_comments = Comment.where(user_id: @user.id)
    @post_comments = Comment.includes(:user).where(post_id: @user_posts.ids)
  end

  def show
    @post = Post.find(params[:id])
    @post_comments = Comment.includes(:user).where(post_id: @post)
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      @post.update_post_counter
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
