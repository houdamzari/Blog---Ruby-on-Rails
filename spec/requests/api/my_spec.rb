require 'swagger_helper'

RSpec.describe 'api/my', type: :request do
  it 'returns a success response' do
    get '/api/my'
    expect(response).to be_successful
  end
end
