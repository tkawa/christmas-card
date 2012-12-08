class CardsController < ApplicationController
  skip_before_filter :basic_authenticate

  # GET /cards/:id
  # GET /cards/:id.json
  def show
    @card = Card.find_by_access_token!(params[:id])
    @destination = @card.destination

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @card }
    end
  end
end
