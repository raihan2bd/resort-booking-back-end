require 'rails_helper'

RSpec.describe Booking, type: :model do
  before :each do
    @user = User.new(name: 'test', email: 'test@test.com', password: '123456')
    @user.save

    @resort = Resort.new(
      user: @user,
      name: 'Lorem ipsum 1',
      location: 'Lorem ipsum dummy location',
      image_url: 'resort.jpg',
      guests_amount: 10,
      description: 'Lorem ispsum dummy description',
      price: 500
    )
    @resort.save
  end

  subject do
    Booking.new(
      user: @user,
      resort: @resort,
      start_date: Date.today,
      end_date: Date.tomorrow,
      address: 'Lorem ipsum address'
    )
  end
  before { subject.save }

  describe 'validate data' do
    it 'should have a start date' do
      subject.start_date = nil
      expect(subject).to_not be_valid
    end

    it 'should have an end date' do
      subject.end_date = nil
      expect(subject).to_not be_valid
    end
    it 'should have an address' do
      subject.address = nil
      expect(subject).to_not be_valid
    end

    it 'should be valid if start_date is before end_date' do
      subject.start_date = Date.tomorrow
      subject.end_date = Date.today
      expect(subject).to_not be_valid
      expect(subject.errors[:start_date]).to include('must be before the end date')
    end

    it 'should be valid if start_date is equal to end_date' do
      subject.start_date = Date.today
      subject.end_date = Date.today
      expect(subject).to_not be_valid
      expect(subject.errors[:start_date]).to include('must be before the end date')
    end

    it 'should be valid if start_date is after end_date' do
      subject.start_date = Date.tomorrow
      subject.end_date = Date.today
      expect(subject).to_not be_valid
      expect(subject.errors[:start_date]).to include('must be before the end date')
    end
  end
end
