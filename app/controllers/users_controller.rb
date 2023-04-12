class UsersController < ApplicationController
    before_action :authenticate_user!
  
  def index
    @users = User.all
  end

  def show
    @user = User.includes(posts: [:comments]).find(params[:id])
    @user_posts = @user.posts
    @recent_posts = @user.recent_posts.includes(:comments)
  end
end
