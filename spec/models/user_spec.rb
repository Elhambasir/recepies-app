require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when creating a user' do
    let (:user) { build :user }
    let (:user1) { build :user, email: nil }
    let (:user2) { build :user, name: nil }

    it 'should be a valid user with all attributes' do
      expect(user.valid?).to eq(true)
    end
    it 'should be invalid without an email' do
      expect(user1.valid?).to eq(false)
    end
    
    it 'should be invalid without a name' do
      expect(user2.valid?).to eq(false)
    end
  end

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
