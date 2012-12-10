class RepliesController < ApplicationController
  respond_to :html, :json
  before_filter { @card = Card.find_by_access_token!(params[:card_id]) }
  before_filter only: [:update, :destroy] do
    @reply = @card.replies.find(params[:id])
  end

  # POST /cards/:card_id/replies
  # POST /cards/:card_id/replies.json
  def create
    @reply = @card.replies.create(params[:reply])
    respond_with @card, location: card_url(id: @card.access_token)
  end

  # PUT /cards/:card_id/replies/:id
  # PUT /cards/:card_id/replies/:id.json
  def update
    @reply.update_attributes(params[:reply])
    respond_with @card, location: card_url(id: @card.access_token)
  end

  # DELETE /cards/:card_id/replies/:id
  # DELETE /cards/:card_id/replies/:id.json
  def destroy
    @reply.destroy
    respond_with @card, location: card_url(id: @card.access_token)
  end
end
