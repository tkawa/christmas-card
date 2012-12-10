require 'spec_helper'

describe Card do
  describe 'status' do
    before do
      @destination = FactoryGirl.create(:destination_1)
    end

    it 'valid' do
      card = @destination.build_card(status: :in_progress)
      card.should be_valid
    end
    it 'should have valid status' do
      card = @destination.build_card(status: :hoge)
      card.should_not be_valid
    end
    it 'should have be unique' do
      card = Card.new
      card.should_not be_valid
    end
  end
end
