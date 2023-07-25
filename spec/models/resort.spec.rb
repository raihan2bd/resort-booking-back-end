require 'rails_helper'

RSpec.describe Resort, type: :model do
  before :each do
    @user = User.new(name: 'test', email: 'test@test.com', password: '123456')
    @user.save
  end

  subject do
    Resort.new(
      user: @user,
      name: 'Lorem ipsum 1',
      location: 'Lorem ipsum dummy location',
      image_url: 'resort.jpg',
      guests_amount: 10,
      description: 'Lorem ispsum dummy decription',
      price: 500
    )
  end
  before { subject.save }

  describe 'validate data' do
    it 'it should have an resort location' do
      subject.location = nil
      expect(subject).to_not be_valid
    end
    it 'it should have an name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'it should have an image url' do
      subject.image_url = nil
      expect(subject).to_not be_valid
    end

    it 'it should have guests amount' do
      subject.guests_amount = nil
      expect(subject).to_not be_valid
    end

    it 'it should have an description' do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it 'it should have an price' do
      subject.price = nil
      expect(subject).to_not be_valid
    end
  end
end
