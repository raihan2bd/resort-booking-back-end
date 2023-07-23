require 'rails_helper'

RSpec.describe 'API::Resorts', type: :request do
  before(:all) do
    @user = FactoryBot.create(:user)
    post '/login', params: { user: { email: @user.email, password: @user.password } }, as: :json
    @authorization = response.header['Authorization']
    @house = FactoryBot.create_list(:resort, 30)
  end

  describe 'GET /resorts' do
    it 'returns a list of resorts' do
      get '/resorts', headers: { Authorization: @authorization }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /resorts/:id' do
    it 'returns a resort' do
      get '/resorts/1', headers: { Authorization: @authorization }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /resorts' do
    it 'creates a resorts if user role is admin' do
      post '/resorts',
           params: { resort: { name: 'Lorem ipsum 1', location: 'lorem ipsum street address', price: 500, description: 'Lorem ipsum resort dummy description', guests_amount: 4, image_url: 'resort1.jpg', user_id: @user.id } },
           headers: { Authorization: @authorization }
      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /resorts/:id' do
    it 'deletes a resort if user role is admin' do
      delete '/resorts/1', headers: { Authorization: @authorization }
      expect(response).to have_http_status(:ok)
    end
  end

end
