require 'rails_helper'

RSpec.describe 'CurrentUser API', type: :request do
  before(:all) do
    @user = FactoryBot.create(:user)
    post '/login', params: { user: { email: @user.email, password: @user.password } }, as: :json
    @authorization = response.header['Authorization']
  end

  let(:Authorization) { @authorization }

  path '/current_user' do
    get 'Retrieve the current user' do
      tags 'User'
      produces 'application/json'
      parameter name: :Authorization, in: :header, type: :string, required: true

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 role: { type: :string }
               },
               required: %w[id name role]
        run_test!
      end
    end
  end
end
