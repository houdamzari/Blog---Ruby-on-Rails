class LikesController < ApplicationController
  before_action :set_post, only: [:new]

  def new
    @like = Like.new
    @like.user = User.find(params[:user_id])
    @like.post = @post

    if @like.save
      on_like_create_success
    else
      on_like_create_failure
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def on_like_create_success
    flash[:notice] = 'Like added successfully!'
    @like.update_likes_counter
    redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id])
  end

  def on_like_create_failure
    flash[:alert] = "Couldn't add a like!"
    puts @like.errors.full_messages
    render :new, status: :unprocessable_entity
  end
end
