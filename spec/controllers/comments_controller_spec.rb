require 'spec_helper'

describe CommentsController do
  before do
    @destination = FactoryGirl.create(:sonic_garden)
    @card = FactoryGirl.create(:sg_card)
  end

  def valid_attributes
    { body: "Foobar", member_id: 1 }
  end

  def valid_session
    {}
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, {:destination_id => @destination.id, :comment => valid_attributes}, valid_session
        }.to change(Comment, :count).by(1)
      end
    end

    it "assigns a newly created comment as @comment" do
      post :create, {:destination_id => @destination.id, :comment => valid_attributes}, valid_session
      assigns(:comment).should be_a(Comment)
      assigns(:comment).should be_persisted
    end

    it "redirects to the parent card" do
      post :create, {:destination_id => @destination.id, :comment => valid_attributes}, valid_session
      response.should redirect_to(destination_card_url(Comment.last.card))
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested comment" do
        comment = @card.comments.create! valid_attributes
        Comment.any_instance.should_receive(:update_attributes).with({ "status" => "ready" })
        put :update, {:id => comment.to_param, :comment => { "status" => "ready" }}, valid_session
      end

      it "assigns the requested comment as @comment" do
        comment = @card.comments.create! valid_attributes
        put :update, {:id => comment.to_param, :comment => valid_attributes}, valid_session
        assigns(:comment).should eq(comment)
      end

      it "redirects to the parent card" do
        comment = @card.comments.create! valid_attributes
        put :update, {:id => comment.to_param, :comment => valid_attributes}, valid_session
        response.should redirect_to(destination_card_url(@card))
      end
    end

    describe "with invalid params" do
      it "assigns the comment as @comment" do
        comment = @card.comments.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        put :update, {:id => comment.to_param, :comment => {  }}, valid_session
        assigns(:comment).should eq(comment)
      end

      it "re-renders the 'edit' template" do
        comment = @card.comments.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        put :update, {:id => comment.to_param, :comment => {  }}, valid_session
        response.should render_template('destinations/cards/show')
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested comment" do
      comment = @card.comments.create! valid_attributes
      expect {
        delete :destroy, {:id => comment.to_param}, valid_session
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the parent card" do
      comment = @card.comments.create! valid_attributes
      delete :destroy, {:id => comment.to_param}, valid_session
      response.should redirect_to(destination_card_url(@card))
    end
  end

end
