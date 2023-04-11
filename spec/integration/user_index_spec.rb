require 'rails_helper'

RSpec.describe "UsersIndex", type: :system do
  before do
  @user1 = User.create!(name: 'User1', photo: 'https://my.alfred.edu/zoom/_images/foster-lake.jpg', bio: 'Bio for User1', postscounter: 2)
  @post1 = @user1.posts.create!(title: 'Post 1 by User1', text: 'Post 1 by User1', comments_counter: 0, likes_counter: 0)
  @post2 = @user1.posts.create!(title: 'Post 2 by User1', text: 'Post 2 by User1', comments_counter: 0, likes_counter: 0)
  
  @user2 = User.create!(name: 'User2', photo: 'https://my.alfred.edu/zoom/_images/foster-lake.jpg', bio: 'Bio for User2', postscounter: 1)
  @post3 = @user2.posts.create!(title: 'Post 1 by User2', text: 'Post 1 by User2', comments_counter: 0, likes_counter: 0)
end


  after do
    # Clean up created data
    @user1.destroy if @user1.present?
    @user2.destroy if @user2.present?
    @post1.destroy if @post1.present?
    @post2.destroy if @post2.present?
    @post3.destroy if @post3.present?
  end

  it 'displays all users information' do
    # Visit the users index page
    visit users_path

    # Check for the presence of user1 and user2 information
    expect(page).to have_content 'User1'
    expect(page).to have_content 'Number of posts: 2'
    expect(page).to have_css("img[src*='https://my.alfred.edu/zoom/_images/foster-lake.jpg']")
    expect(page).to have_link 'View Profile', href: user_path(@user1)

    expect(page).to have_content 'User2'
    expect(page).to have_content 'Number of posts: 1'
    expect(page).to have_link 'View Profile', href: user_path(@user2)

    # Check if clicking on a user redirects to the user's show page
find("a[href='#{user_path(@user1.reload)}']").click
expect(page).to have_current_path user_path(@user1.reload)
  end
end
