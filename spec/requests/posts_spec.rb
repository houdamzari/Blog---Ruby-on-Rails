require 'rails_helper'

RSpec.describe PostsController, type: :request do
  let(:user_id) { 745 }
  let(:post_id) { 3 }

  describe 'GET /index' do
    before { get "/users/#{user_id}/posts" }

    it 'returns a success response' do
      expect(response).to be_successful
    end

    it 'renders the index template of views/users' do
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text' do
      result = response.body
      expect(result).to include('showing lists of all posts for a user')
    end
  end

  describe 'GET #show' do
    before { get "/users/#{user_id}/posts/#{post_id}" }

    it 'returns a success response' do
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text' do
      result = response.body
      expect(result).to include('showing post details of selected post')
    end
  end
end