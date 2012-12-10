class MessagesController < ApplicationController
  # POST /destinations/:destination_id/card/messages
  # POST /destinations/:destination_id/card/messages.json
  def create
    @destination = Destination.find(params[:destination_id])
    begin
      ActiveRecord::Base.transaction do
        @message = (@destination.card || @destination.create_card!(status: :in_progress)).messages.create!(params[:message])
      end

      respond_to do |format|
        format.html { redirect_to destination_card_url(@destination), notice: 'Message was successfully created.' }
        format.json { render json: @message, status: :created, location: @message }
      end
    rescue
      respond_to do |format|
        format.html { render 'destinations/cards/show' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to destination_card_url(@message.card.destination), notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render 'destinations/cards/show' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to destination_card_url(@message.card.destination), notice: 'Message was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
