class CommentsController < ApplicationController
  # POST /destinations/:destination_id/card/comments
  # POST /destinations/:destination_id/card/comments.json
  def create
    @destination = Destination.find(params[:destination_id])
    begin
      @comment = @destination.card.comments.build(params[:comment])
    rescue NoMethodError
      raise ActiveRecord::RecordNotFound
    end

    respond_to do |format|
      if @comment.save
        format.html { redirect_to destination_card_url(@destination), notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render 'destinations/cards/show' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to destination_card_url(@comment.card), notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render 'destinations/cards/show' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to destination_card_url(@comment.card) }
      format.json { head :no_content }
    end
  end
end
