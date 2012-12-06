# coding: utf-8
require 'spec_helper'

describe CommentDecorator do
  describe '#body_html' do
    let(:comment) { Comment.new }
    subject { decorate(comment).body_html }

    describe 'body includes linebreak' do
      before { comment.body =  "Foo\nBar" }
      it { should eq "Foo<br>Bar" }
    end
  end
end
