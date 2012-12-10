require 'spec_helper'

describe RepliesController do
  before do
    @card = FactoryGirl.create(:card_1)
  end

  def valid_attributes
    { name: 'Name', body: "Foobar" }
  end

  def valid_session
    {}
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Reply" do
        expect {
          post :create, { card_id: @card.access_token, reply: valid_attributes }, valid_session
        }.to change(Reply, :count).by(1)
      end

      it "assigns a newly created reply as @reply" do
        post :create, { card_id: @card.access_token, reply: valid_attributes }, valid_session
        assigns(:reply).should be_a(Reply)
        assigns(:reply).should be_persisted
      end

      it "redirects to the parent card" do
        post :create, { card_id: @card.access_token, reply: valid_attributes }, valid_session
        response.should redirect_to(card_url(id: Reply.last.card.access_token))
      end
    end

    describe "with invalid access token of the card" do
      it "raises RecordNotFound" do
        expect {
          post :create, { card_id: 'invalidxxx', reply: valid_attributes }, valid_session
        }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  describe "PUT update" do
    describe "with valid access token of the card" do
      it "updates the requested reply" do
        reply = @card.replies.create! valid_attributes
        Reply.any_instance.should_receive(:update_attributes).with({ "body" => "FooBarBaz" })
        put :update, { id: reply.to_param, card_id: @card.access_token, reply: { "body" => "FooBarBaz" }}, valid_session
      end

      it "assigns the requested reply as @reply" do
        reply = @card.replies.create! valid_attributes
        put :update, { id: reply.to_param, card_id: @card.access_token, reply: valid_attributes }, valid_session
        assigns(:reply).should eq(reply)
      end

      it "redirects to the parent card" do
        reply = @card.replies.create! valid_attributes
        put :update, { id: reply.to_param, card_id: @card.access_token, reply: valid_attributes }, valid_session
        response.should redirect_to(card_url(id: @card.access_token))
      end
    end

    describe "with invalid access token of the card" do
      it "raises RecordNotFound" do
        reply = @card.replies.create! valid_attributes
        expect {
          put :update, { id: reply.to_param, card_id: 'invalidxxx', reply: valid_attributes }, valid_session
        }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  describe "DELETE destroy" do
    describe "with valid access token of the card" do
      it "destroys the requested reply" do
        reply = @card.replies.create! valid_attributes
        expect {
          delete :destroy, { id: reply.to_param, card_id: @card.access_token }, valid_session
        }.to change(Reply, :count).by(-1)
      end

      it "redirects to the parent card" do
        reply = @card.replies.create! valid_attributes
        delete :destroy, { id: reply.to_param, card_id: @card.access_token }, valid_session
        response.should redirect_to(card_url(id: @card.access_token))
      end
    end

    describe "with invalid access token of the card" do
      it "raises RecordNotFound" do
        reply = @card.replies.create! valid_attributes
        expect {
          delete :destroy, { id: reply.to_param, card_id: 'invalidxxx', reply: valid_attributes }, valid_session
        }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

end
