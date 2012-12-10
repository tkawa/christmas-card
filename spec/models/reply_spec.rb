require 'spec_helper'

describe Reply do
  it 'blank reply is invalid' do
    reply = Reply.new
    reply.should_not be_valid
  end
  it 'valid' do
    reply = FactoryGirl.create(:reply_1)
    reply.should be_valid
  end
end
