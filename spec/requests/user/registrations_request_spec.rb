require 'rails_helper'

RSpec.describe Users:: RegistrationsController, type: :request do
  describe 'POST /signup' do
    it 'creates a new user' do
      post '/signup',
           params: { user: { name: 'test', email: 'testing@test.com',
                             password: '123456' } }, as: :json
      expect(response).to have_http_status(:ok)
    end
  end
end
