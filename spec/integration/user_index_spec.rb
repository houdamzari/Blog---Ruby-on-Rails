require 'rails_helper'
require 'capybara/rspec'

class UserIndexIntegrationTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    @user1 = User.create!(name: 'User1', photo: 'photo1.jpg', bio: 'Bio for User1', postscounter: 0)
    @user2 = User.create!(name: 'User2', photo: 'photo2.jpg', bio: 'Bio for User2', postscounter: 0)

    @post1 = @user1.posts.create!(text: 'Post1 by User1')
    @post2 = @user2.posts.create!(text: 'Post2 by User2')
  end

  def teardown
    @user1.destroy
    @user2.destroy
    @post1.destroy
    @post2.destroy
  end

  test 'user index page' do
    visit '/users'

    assert_text 'User1'
    assert_text 'User2'

    assert_selector "img[src='photo1.jpg']"
    assert_selector "img[src='photo2.jpg']"

    assert_text 'Number of posts: 1'
    assert_text 'Number of posts: 1'

    click_link 'View Profile', href: user_path(@user1)
    assert_current_path user_path(@user1)
  end
end
