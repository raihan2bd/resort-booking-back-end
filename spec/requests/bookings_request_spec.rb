require 'swagger_helper'

RSpec.describe 'Bookings API', type: :request do
  before(:all) do
    @user = FactoryBot.create(:user)
    post '/login', params: { user: { email: @user.email, password: @user.password } }, as: :json
    @authorization = response.header['Authorization']
    @resort = FactoryBot.create(:resort)
    @booking = FactoryBot.create(:booking)
  end

  let(:Authorization) { @authorization }
  let(:user_id) { @user.id }
  let(:resort_id) { @resort.id }
  let(:start_date) { '2020-07-01' }
  let(:end_date) { '2020-07-02' }
  let(:address) { 'lorem ipsum' }
  let(:booking) do
    {
      booking: {
        user_id:,
        resort_id:,
        start_date:,
        end_date:,
        address:
      }
    }
  end

  path '/bookings' do
    get 'Retrieve all bookings of the user' do
      tags 'Bookings'
      produces 'application/json'
      parameter name: :Authorization, in: :header, type: :string, required: true

      response '200', 'OK' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer }, user_id: { type: :integer }, resort_id: { type: :integer },
                   start_date: { type: :string, format: :date }, end_date: { type: :string, format: :date },
                   address: { type: :string }, created_at: { type: :string, format: :date_time },
                   updated_at: { type: :string, format: :date_time }
                 },
                 required: %w[id user_id resort_id start_date end_date address created_at updated_at]
               }
        run_test!
      end
    end

    post 'Create a new resort booking' do
      tags 'Bookings'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :Authorization, in: :header, type: :string, required: true
      parameter name: :booking, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer }, resort_id: { type: :integer }, start_date: { type: :string, format: :date },
          end_date: { type: :string, format: :date }, address: { type: :string }
        },
        required: %w[user_id resort_id start_date end_date address]
      }

      response '201', 'Created' do
        run_test!
      end
    end
  end

  path '/bookings/{id}' do
    parameter name: :id, in: :path, type: :integer, required: true
    let(:id) { @booking.id }

    delete 'Delete a booking if user is the author or user role is admin' do
      tags 'Bookings'
      produces 'application/json'
      parameter name: :Authorization, in: :header, type: :string, required: true

      response '200', 'OK' do
        run_test!
      end
    end
  end
end
