class Destinations::CardsController < ApplicationController
  before_filter { @destination = Destination.find(params[:destination_id]) }

  # GET /destinations/:destination_id/card
  # GET /destinations/:destination_id/card.json
  def show
    @card = @destination.card || @destination.build_card
    #@card = Card.where(destination_id: params[:destination_id]).first_or_initialize

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @card }
    end
  end

  # GET /destinations/:destination_id/card/new
  # GET /destinations/:destination_id/card/new.json
  def new
    @card = @destination.build_card

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @card }
    end
  end

  # GET /destinations/:destination_id/card/edit
  def edit
    @card = @destination.card
  end

  # POST /destinations/:destination_id/card
  # POST /destinations/:destination_id/card.json
  def create
    @card = @destination.build_card(params[:card])

    respond_to do |format|
      if @card.save
        format.html { redirect_to [@destination, @card], notice: 'Card was successfully created.' }
        format.json { render json: @card, status: :created, location: @card }
      else
        format.html { render action: "new" }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /destinations/:destination_id/card
  # PUT /destinations/:destination_id/card.json
  def update
    @card = @destination.card

    respond_to do |format|
      if @card.update_attributes(params[:card])
        format.html { redirect_to [@destination, @card], notice: 'Card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /destinations/:destination_id/card
  # DELETE /destinations/:destination_id/card.json
  def destroy
    @card = @destination.card
    @card.destroy

    respond_to do |format|
      format.html { redirect_to destination_card_url(@destination) }
      format.json { head :no_content }
    end
  end
end
