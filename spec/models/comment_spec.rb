require 'spec_helper'

describe Comment do
  it 'blank comment is invalid' do
    comment = Comment.new
    comment.should_not be_valid
  end
  it 'valid' do
    comment = FactoryGirl.create(:comment_1)
    comment.should be_valid
  end
end
