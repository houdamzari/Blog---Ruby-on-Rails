class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable
  has_many :posts, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id

  validates :name, presence: true
  validates :postscounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, on: :update

  before_create :set_default_postscounter

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def admin?
    role == "admin"
  end
  
  private

  def set_default_postscounter
    self.postscounter ||= 0
  end
end
