class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = Post.where(author_id: @user.id)
    @user_comments = Comment.where(user_id: @user.id)
    @post_comments = Comment.where(post_id: @user_posts.ids)
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @post_comments = Comment.where(post_id: @post)
    @likes = @post.likes
    @user_posts = @user.posts 
  end
end
