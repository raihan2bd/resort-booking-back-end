require 'swagger_helper'

RSpec.describe Users::RegistrationsController, type: :request do
  before(:all) do
    @user = FactoryBot.create(:user)
    post '/login', params: { user: { email: @user.email, password: @user.password } }, as: :json
    @authorization = response.header['Authorization']
  end

  let(:user) do
    {
      user: {
        name: 'Testing',
        email: 'testing5@test.com',
        password: '123456',
        role: 'admin'
      }
    }
  end

  path '/signup' do
    post 'Create a new user' do
      tags 'User'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          password: { type: :string },
          role: { type: :string }
        },
        required: %w[name email password role]
      }

      response '200', 'OK' do
        run_test!
      end
    end
  end
end
