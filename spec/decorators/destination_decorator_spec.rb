# coding: utf-8
require 'spec_helper'

describe DestinationDecorator do
  describe 'vanilla' do
    #let(:destination) { Destination.new.extend DestinationDecorator }
    let(:destination) { Destination.new }
    subject { decorate(destination) }
    it { should be_a Destination }
    its(:status_label) { should eq '<span class="label none">None</span>' }
  end

  describe 'change status' do
    before do
      d = FactoryGirl.create(:sonic_garden)
      FactoryGirl.create(:sg_card)
      @destination = decorate(d)
    end
    it { @destination.status_label.should eq '<span class="label in_progress">In progress</span>' }
    it {
      @destination.card.status = :ready
      @destination.status_label.should eq '<span class="label ready">Ready</span>'
    }
  end
end
