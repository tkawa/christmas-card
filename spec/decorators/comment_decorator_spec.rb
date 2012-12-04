# coding: utf-8
require 'spec_helper'

describe CommentDecorator do
  describe 'vanilla' do
    let(:comment) { Comment.new }
    subject { decorate(comment) }
    it { should be_a Comment }
  end

  describe 'body includes linebreak' do
    let(:comment) { Comment.new(body: "Foo\nBar") }
    subject { decorate(comment) }
    its(:body_html) { should eq "Foo<br>Bar" }
  end
end
