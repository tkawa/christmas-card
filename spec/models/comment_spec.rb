require 'spec_helper'

describe Message do
  it 'blank message is invalid' do
    message = Message.new
    message.should_not be_valid
  end
  it 'valid' do
    message = FactoryGirl.create(:message_1)
    message.should be_valid
  end
end
