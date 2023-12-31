require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    @user = User.create(name: 'user')
    Recipe.create(name: 'rice', preparation_time: 1, cooking_time: 2, description: 'description',
                  public: true, user_id: 1)
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should not be too short' do
    subject.name = 'b'
    expect(subject).to_not be_valid
  end

  it 'name should not be too long' do
    subject.name = 'b' * 300
    expect(subject).to_not be_valid
  end

  it 'name should not be empty' do
    subject.name = ' '
    expect(subject).to_not be_valid
  end

  it 'name should have valid value' do
    expect(subject.name).to eql 'rice'
  end

  it 'preparation time should be present' do
    subject.preparation_time = nil
    expect(subject).to_not be_valid
  end

  it 'preparation time must not be less than 1' do
    subject.preparation_time = -1
    expect(subject).to_not be_valid
  end

  it 'cokking time should be present' do
    subject.cooking_time = nil
    expect(subject).to_not be_valid
  end

  it 'cooking time must not be less than 1' do
    subject.cooking_time = -1
    expect(subject).to_not be_valid
  end

  it 'description should be present' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'description should not be empty' do
    subject.description = ' '
    expect(subject).to_not be_valid
  end

  it 'public should be a boolean' do
    expect(subject.public).to be(false).or be(true)
  end

  it 'public should have valid value' do
    expect(subject.public).to eql true
  end
end
