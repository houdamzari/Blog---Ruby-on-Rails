class UsersController < ApplicationController
    before_action :authenticate_user!
  
  def index
    @users = User.all
  end

  def show
  user_id = params[:id].to_i
  if user_id > 0
    @user = User.includes(posts: [:comments]).find(user_id)
    @user_posts = @user.posts
    @recent_posts = @user.recent_posts.includes(:comments)
  else
    redirect_to root_path, notice: "User not found"
  end
end

end
