require 'swagger_helper'

RSpec.describe 'Resorts API', type: :request do
  # Initialize data before running the request specs
  before(:all) do
    @user = FactoryBot.create(:user)
    post '/login', params: { user: { email: @user.email, password: @user.password } }, as: :json
    @authorization = response.header['Authorization']
    @resorts = FactoryBot.create_list(:resort, 30)
  end

  let(:Authorization) { @authorization }
  let(:name) { 'Lorem ipsum' }
  let(:location) { 'loremipsum sit amet doller' }
  let(:price) { 25 }
  let(:description) { 'lorem ipsum sit amet doller' }
  let(:guests_amount) { 4 }
  let(:image_url) { 'lorem.jpg' }
  let(:user_id) { @user.id }
  let(:resort) do
    {
      name:,
      location:,
      price:,
      description:,
      guests_amount:,
      image_url:,
      user_id:
    }
  end

  path '/resorts' do
    get 'Retrieve a list of resorts' do
      tags 'Resorts'
      produces 'application/json'
      parameter name: :Authorization, in: :header, type: :string, required: true

      response '200', 'OK' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   location: { type: :string },
                   price: { type: :number },
                   description: { type: :string },
                   guests_amount: { type: :integer },
                   image_url: { type: :string },
                   user_id: { type: :integer },
                   created_at: { type: :string, format: :date_time },
                   updated_at: { type: :string, format: :date_time }
                 },
                 required: %w[id name location price description guests_amount image_url user_id created_at updated_at]
               }
        run_test!
      end
    end
  end

  path '/resorts/{id}' do
    parameter name: :id, in: :path, type: :integer, required: true
    let(:id) { @resorts.first.id }

    get 'Retrieve a resort' do
      tags 'Resorts'
      produces 'application/json'
      parameter name: :Authorization, in: :header, type: :string, required: true

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 location: { type: :string },
                 price: { type: :number },
                 description: { type: :string },
                 guests_amount: { type: :integer },
                 image_url: { type: :string },
                 user_id: { type: :integer },
                 created_at: { type: :string, format: :date_time },
                 updated_at: { type: :string, format: :date_time }
               }

        run_test!
      end
    end
  end

  path '/resorts' do
    post 'Create a resort if user role is admin' do
      tags 'Resorts'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :Authorization, in: :header, type: :string, required: true
      parameter name: :resort, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          location: { type: :string },
          price: { type: :number },
          description: { type: :string },
          guests_amount: { type: :integer },
          image_url: { type: :string },
          user_id: { type: :integer }
        },
        required: %w[name location price description guests_amount image_url user_id]
      }

      response '201', 'Created' do
        run_test!
      end
    end
  end


  path '/resorts/{id}' do
    parameter name: :id, in: :path, type: :integer, required: true

    let(:id) { @resorts.first.id }

    delete 'Delete a resort if user role is admin' do
      tags 'Resorts'
      produces 'application/json'
      parameter name: :Authorization, in: :header, type: :string, required: true

      response '200', 'OK' do
        run_test!
      end
    end
  end
end
