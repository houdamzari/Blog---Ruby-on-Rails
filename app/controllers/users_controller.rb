class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :update_allowed_parameters, if: :devise_controller?

  def index
    @users = User.all
  end

  def show
    user_id = params[:id].to_i
    if user_id.positive?
      @user = User.includes(posts: [:comments]).find(user_id)
      @user_posts = @user.posts
      @recent_posts = @user.recent_posts.includes(:comments)
    else
      redirect_to root_path, notice: 'User not found'
    end
  end

  def destroy
    sign_out current_user
    redirect_to root_path, notice: 'Signed out successfully'
  end
end
