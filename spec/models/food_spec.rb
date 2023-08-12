require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user) { FactoryBot.create(:user) }

  it 'is valid with valid attributes' do
    food = FactoryBot.build(:food, user:)
    expect(food).to be_valid
  end

  it 'is not valid without a name' do
    food = FactoryBot.build(:food, name: nil, user:)
    expect(food).to_not be_valid
  end

  it 'is not valid without a price' do
    food = FactoryBot.build(:food, price: nil, user:)
    expect(food).to_not be_valid
  end

  it 'is not valid without a quantity' do
    food = FactoryBot.build(:food, quantity: nil, user:)
    expect(food).to_not be_valid
  end
end
