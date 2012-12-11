# coding: utf-8
require 'spec_helper'

describe ReplyDecorator do
  describe '#body_html' do
    let(:reply) { Reply.new }
    subject { decorate(reply).body_html }

    describe 'body includes linebreak' do
      before { reply.body =  "Foo\nBar" }
      it { should eq "Foo<br>Bar" }
    end
  end
end
