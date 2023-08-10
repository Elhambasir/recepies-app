require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it "is not valid without a name" do
    user = FactoryBot.build(:user, name: nil)
    expect(user).not_to be_valid
  end

  it "is not valid without an email" do
    user = FactoryBot.build(:user, email: nil)
    expect(user).not_to be_valid
  end

  # Add more validation tests if needed

  describe "associations" do
    it "should have many foods" do
      user = FactoryBot.create(:user)
      expect(user.foods).to be_empty
    end
  
    it "should have many recipes" do
      user = FactoryBot.create(:user)
      expect(user.recipes).to be_empty
    end
  end
end
