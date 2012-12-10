require "spec_helper"

describe Destinations::CardsController do
  describe "routing" do

    it "routes to #show" do
      get("/destinations/1/card").should route_to("destinations/cards#show", :destination_id => "1")
    end

    it "routes to #create" do
      post("/destinations/1/card").should route_to("destinations/cards#create", :destination_id => "1")
    end

    it "routes to #update" do
      put("/destinations/1/card").should route_to("destinations/cards#update", :destination_id => "1")
    end

    it "routes to #destroy" do
      delete("/destinations/1/card").should route_to("destinations/cards#destroy", :destination_id => "1")
    end

  end
end
