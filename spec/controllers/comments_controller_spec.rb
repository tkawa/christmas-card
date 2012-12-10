require 'spec_helper'

describe MessagesController do
  auth_admin
  before do
    @destination = FactoryGirl.create(:destination_1)
    @destination_without_card = FactoryGirl.create(:destination_2)
    @card = FactoryGirl.create(:card_1)
  end

  def valid_attributes
    { body: "Foobar", member_id: 1 }
  end

  def valid_session
    {}
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Message" do
        expect {
          post :create, {:destination_id => @destination.id, :message => valid_attributes}, valid_session
        }.to change(Message, :count).by(1)
      end

      it "assigns a newly created message as @message" do
        post :create, {:destination_id => @destination.id, :message => valid_attributes}, valid_session
        assigns(:message).should be_a(Message)
        assigns(:message).should be_persisted
      end

      it "redirects to the parent card" do
        post :create, {:destination_id => @destination.id, :message => valid_attributes}, valid_session
        response.should redirect_to(destination_card_url(Message.last.card))
      end
    end

    describe "when card not found" do
      it "creates a new Message" do
        expect {
          post :create, {:destination_id => @destination_without_card.id, :message => valid_attributes}, valid_session
        }.to change(Message, :count).by(1)
      end

      it "assigns a newly created message as @message" do
        post :create, {:destination_id => @destination_without_card.id, :message => valid_attributes}, valid_session
        assigns(:message).should be_a(Message)
        assigns(:message).should be_persisted
        assigns(:message).card.should be_persisted
      end

      it "redirects to the parent card" do
        post :create, {:destination_id => @destination_without_card.id, :message => valid_attributes}, valid_session
        response.should redirect_to(destination_card_url(Message.last.card))
      end
    end

    describe "with invalid params" do
      describe "when card not found" do
        it "re-renders the 'edit' template" do
          post :create, {:destination_id => @destination_without_card.id, :message => { }}, valid_session
          response.should render_template('destinations/cards/show')
        end
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested message" do
        message = @card.messages.create! valid_attributes
        Message.any_instance.should_receive(:update_attributes).with({ "status" => "ready" })
        put :update, {:id => message.to_param, :message => { "status" => "ready" }}, valid_session
      end

      it "assigns the requested message as @message" do
        message = @card.messages.create! valid_attributes
        put :update, {:id => message.to_param, :message => valid_attributes}, valid_session
        assigns(:message).should eq(message)
      end

      it "redirects to the parent card" do
        message = @card.messages.create! valid_attributes
        put :update, {:id => message.to_param, :message => valid_attributes}, valid_session
        response.should redirect_to(destination_card_url(@card))
      end
    end

    describe "with invalid params" do
      it "assigns the message as @message" do
        message = @card.messages.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Message.any_instance.stub(:save).and_return(false)
        put :update, {:id => message.to_param, :message => {  }}, valid_session
        assigns(:message).should eq(message)
      end

      it "re-renders the 'edit' template" do
        message = @card.messages.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Message.any_instance.stub(:save).and_return(false)
        put :update, {:id => message.to_param, :message => {  }}, valid_session
        response.should render_template('destinations/cards/show')
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested message" do
      message = @card.messages.create! valid_attributes
      expect {
        delete :destroy, {:id => message.to_param}, valid_session
      }.to change(Message, :count).by(-1)
    end

    it "redirects to the parent card" do
      message = @card.messages.create! valid_attributes
      delete :destroy, {:id => message.to_param}, valid_session
      response.should redirect_to(destination_card_url(@card))
    end
  end

end
