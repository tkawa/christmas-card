require 'spec_helper'

describe CardsController do
  let(:card) { FactoryGirl.create(:card_1) }
  describe "GET show" do
    before { get 'show', id: card.access_token }
    context "responds successfully" do
      subject { response }
      it { should be_success }
    end

    context "assigns the requested card as @card" do
      subject { assigns(:card) }
      it { should eq(card) }
    end
  end
end
