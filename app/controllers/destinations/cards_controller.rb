class Destinations::CardsController < ApplicationController
  respond_to :html, :json
  before_filter { @destination = Destination.find(params[:destination_id]) }

  # GET /destinations/:destination_id/card
  # GET /destinations/:destination_id/card.json
  def show
    @card, status =
      if @destination.card
        [@destination.card, :ok]
      else
        flash.now[:notice] = 'Card is not created yet.'
        [@destination.build_card, :not_found]
      end

    respond_with @destination, @card, status: status
  end

  # POST /destinations/:destination_id/card
  # POST /destinations/:destination_id/card.json
  def create
    # TODO: Using Special exception with rescue_from
    head :not_implemented # 501
  end

  # PUT /destinations/:destination_id/card
  # PUT /destinations/:destination_id/card.json
  def update
    @card = @destination.card || @destination.build_card
    @card.attributes = params[:card]

    respond_to do |format|
      if @card.save
        format.html { redirect_to destination_card_url(@card), notice: 'Card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /destinations/:destination_id/card
  # DELETE /destinations/:destination_id/card.json
  def destroy
    @card = @destination.card
    @card.destroy

    respond_with @destination, @card, location: destination_card_url(@destination)
  end
end
