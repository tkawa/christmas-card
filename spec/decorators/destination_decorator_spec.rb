# coding: utf-8
require 'spec_helper'

describe DestinationDecorator do
  describe '#status_label' do
    subject { decorate(destination).status_label }

    describe 'no card' do
      let(:destination) { Destination.new }
      it { should have_tag 'span.label.none', text: 'None' }
    end

    describe 'change status' do
      before do
        FactoryGirl.create(:card_1)
      end
      let(:destination) { FactoryGirl.create(:destination_1) }

      context 'initial as ready' do
        it { should have_tag 'span.label.ready', text: 'Ready' }
      end

      context 'change to sent' do
        before { destination.card.status = :sent }
        it { should have_tag 'span.label.sent', text: 'Sent' }
      end
    end
  end
end
