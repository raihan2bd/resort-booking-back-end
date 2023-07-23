require 'rails_helper'

RSpec.describe 'API::Bookings', type: :request do
  before(:all) do
    @user = FactoryBot.create(:user)
    post '/login', params: { user: { email: @user.email, password: @user.password } }, as: :json
    @authorization = response.header['Authorization']
    @resort = FactoryBot.create(:resort)
    @booking = FactoryBot.create(:booking)
  end

  describe 'GET /bookings' do
    it 'returns all bookings of the user' do
      get '/bookings', headers: { Authorization: @authorization }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /bookings' do
    it 'it will return unauthorize user error' do
      post '/bookings', params: {
        booking: {
          user_id: @user.id,
          resort_id: @resort.id,
          start_date: '2020-07-01',
          end_date: '2020-07-02',
          address: 'lorem ipsum'
        }
      }
      expect(response).to have_http_status(:unauthorized)
    end

    it 'creates a new resort booking' do
      post '/bookings', params: {
        booking: {
          user_id: @user.id,
          resort_id: @resort.id,
          start_date: '2020-07-01',
          end_date: '2020-07-02',
          address: 'lorem ipsum'
        }
      }, headers: { Authorization: @authorization }
      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /bookings/:id' do
    it 'deletes a bookings if user is the author or booking or user role is admin' do
      delete "/bookings/#{@booking.id}", headers: { Authorization: @authorization }
      expect(response).to have_http_status(:ok)
    end
  end
end
