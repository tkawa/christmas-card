# coding: utf-8
require 'spec_helper'

describe MessageDecorator do
  describe '#body_html' do
    let(:message) { Message.new }
    subject { decorate(message).body_html }

    describe 'body includes linebreak' do
      before { message.body =  "Foo\nBar" }
      it { should eq "Foo<br>Bar" }
    end
  end
end
