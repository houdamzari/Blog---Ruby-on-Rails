require_relative '../rails_helper'

RSpec.describe 'User testing', type: :feature do
  describe 'index page' do
    before(:example) do
      @user = User.create(name: 'Jane Doe', photo: 'https://www.someurl.com', bio: 'Fullstack Developer',
                          postscounter: 1)
      visit users_path
    end

    it 'renders the username of all other users.' do
      User.all.each do |user|
        expect(page).to have_content(user.name)
      end
    end

    it 'should render correct posts number ' do
      User.all.each do |user|
        expect(page).to have_content(user.postscounter)
      end
    end

    describe 'show page' do
      before(:example) do
        @user = User.create(name: 'Jane Doe', photo: 'https://www.someurl.com', bio: 'Fullstack Developer',
                            postscounter: 3)
        @post1 = Post.create(title: 'My First Post', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                             comments_counter: 1, likes_counter: 1, author: @user)
        @post2 = Post.create(title: 'My Second Post', text: 'Morbi luctus scelerisque sodales.', comments_counter: 1,
                             likes_counter: 1, author: @user)
        visit user_path(id: @user.id)
      end

      it "should render user's profile picture" do
        expect(page).to have_xpath("//img[@src = '#{@user.photo}' ]")
      end

      it 'should render user name' do
        expect(page).to have_content(@user.name)
      end

      it 'should render number of posts the user has written' do
        expect(page).to have_content(@user.postscounter)
      end

      it "should render user's bio" do
        expect(page).to have_content(@user.bio)
      end

      it "should render user's first 3 posts" do
        expect(page).to have_content(@post1.text)
        expect(page).to have_content(@post2.text)
        expect(page).to have_content(@post3.text)
      end

      it "should have a button to view all of a user's posts" do
        expect(page).to have_link('See all posts', href: user_posts_path(user_id: @user.id))
      end

      it 'should redirects to all posts show page.' do
        click_link 'See all posts'
        expect(page).to have_current_path(user_posts_path(user_id: @user.id))
      end
    end
  end
end
