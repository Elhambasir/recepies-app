require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { FactoryBot.create(:user) }
  
  it 'should fetch root path succesfully' do
    get '/'
    expect(response).to be_successful
  end

  it 'should show a welcome message for logged-in users' do
    get '/'
    expect(response.body).to include('Welcome')
  end
  
  it 'should show a navbar' do
    get '/'
    expect(response.body).to include('Home')
    expect(response.body).to include('Recipes')
    expect(response.body).to include('Sign In')
    expect(response.body).to include('Register')
    expect(response.body).to include('Shopping List')
    expect(response.body).to include('Foods')
  end
end
