class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_likes_counter
    post.update(likes_counter: post.likes_counter + 1)
  end
end
