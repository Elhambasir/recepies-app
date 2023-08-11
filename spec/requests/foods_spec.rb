require 'rails_helper'

RSpec.describe "Foods", type: :request do
  let (:user) { create :user }

  after do
    Food.destroy_all
    User.destroy_all
  end

  describe "GET /foods" do
    it "gets lists of foods" do
      get foods_path
      expect(response).to have_http_status(200)
      expect(response.body).to include('name')
      expect(response.body).to_not include('New Food')
    end
  end

  describe 'When logged in' do
    before do
      user.save
      sign_in user
    end

    context "NEW /foods/new" do
      it 'gets the form' do
        get new_food_path
        expect(response).to have_http_status(200)
        expect(response.body).to include('Create Food')
      end
    end

    context 'CREATE' do
      let(:food) { create :food, name: 'Peas', user: user }
      
      it 'renders a successful response' do
        food.save
        get foods_path
        expect(response).to be_successful
        expect(response.body).to include('Peas')
      end
    end
  end

end
