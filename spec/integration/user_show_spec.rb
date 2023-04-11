require 'rails_helper'

RSpec.describe "UserShow", type: :system do
before do
      @user1 = User.create!(name: 'User1', photo: 'https://my.alfred.edu/zoom/_images/foster-lake.jpg', bio: 'Bio for User1', postscounter: 1)
  @post1 = @user1.posts.create!(
    title: 'Post1 by User1',
    text: 'Post1 by User1',
    comments_counter: 0,
    likes_counter: 0
  )
    @user2 = User.create!(name: 'User2', photo: 'https://my.alfred.edu/zoom/_images/foster-lake.jpg', bio: 'Bio for User2', postscounter: 1)
  @post2 = @user1.posts.create!(
    title: 'Post1 by User2',
    text: 'Post1 by User2',
    comments_counter: 0,
    likes_counter: 0
  )  end

  after do
    @user1.destroy if @user1.present?
    @user2.destroy if @user2.present?
  @post1.destroy if @post1.present?
  @post2.destroy if @post2.present?
  end

  it 'displays user show page information' do
    visit user_path(@user1)

    expect(page).to have_content 'User1'
    expect(page).to have_content 'Number of posts: 1'
    expect(page).to have_content 'Bio for User1'
    expect(page).to have_content 'Post1 by User1'
    expect(page).to have_link 'See all posts', href: user_posts_path(@user1)

    have_link 'Post1 by User1', href: user_post_path(@user1, @post1)
    expect(page).to have_current_path user_post_path(@user1, @post1)

    visit user_path(@user1)
    have_link 'See all posts', href: user_posts_path(@user1)
    expect(page).to have_current_path user_posts_path(@user1)
  end
end
