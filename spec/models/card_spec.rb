require 'spec_helper'

describe Card do
  describe 'status' do
    before do
      @sonic_garden = FactoryGirl.create(:sonic_garden)
    end

    it 'valid' do
      card = @sonic_garden.build_card(status: :in_progress)
      card.should be_valid
    end
    it 'should have valid status' do
      card = @sonic_garden.build_card(status: :hoge)
      card.should_not be_valid
    end
    it 'should have be unique' do
      card = Card.new
      card.should_not be_valid
    end
  end
end
