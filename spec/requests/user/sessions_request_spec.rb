require 'swagger_helper'

RSpec.describe Users::SessionsController, type: :request do
  before(:all) do
    @user = FactoryBot.create(:user)
  end

  let(:user) do
    {
      user: {
        email: @user.email,
        password: @user.password
      }
    }
  end
  path '/login' do
    post 'login a user' do
      tags 'User'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[email password] # Make sure role is required
      }

      response '200', 'OK' do
        run_test!
      end
    end
  end
end
