require 'rails_helper'

RSpec.describe 'GeneralShoppingLists', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/general_shopping_lists/'
      expect(response.body).to include('You are being')
    end
  end
end
