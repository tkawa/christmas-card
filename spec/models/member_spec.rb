require 'spec_helper'

describe Member do
  it 'blank member is invalid' do
    member = Member.new
    member.should_not be_valid
  end
  it 'valid' do
    member = FactoryGirl.create(:member_3)
    member.should be_valid
  end
end
