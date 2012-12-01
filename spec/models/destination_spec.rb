require 'spec_helper'

describe Destination do
  describe 'email' do
    before do
      @sonic_garden = FactoryGirl.create(:sonic_garden)
    end

    it 'valid' do
      destination = Destination.new(email: '', name: 'bar')
      destination.should be_valid
    end
    it 'should be unique' do
      destination = Destination.new(email: @sonic_garden.email, name: 'bar')
      destination.should_not be_valid
    end
  end
end
