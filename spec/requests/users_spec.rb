require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'should show a welcome message for non-logged in users' do
      get root_path
      expect(response.body).to include('Welcome')
    end
  end
end
