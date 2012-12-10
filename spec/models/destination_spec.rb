require 'spec_helper'

describe Destination do
  describe 'email' do
    before do
      @destination = FactoryGirl.create(:destination_1)
    end

    it 'valid' do
      destination = Destination.new(email: '', name: 'bar')
      destination.should be_valid
    end
    it 'should be unique' do
      destination = Destination.new(email: @destination.email, name: 'bar')
      destination.should_not be_valid
    end
  end
end
