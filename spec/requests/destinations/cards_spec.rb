require 'spec_helper'

describe "Destinations::Cards" do
  describe "GET /destination/:destination_id/card" do
    before do
      @destination = FactoryGirl.create(:destination_1)
      @card = FactoryGirl.create(:card_1)
    end
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get destination_card_path(@destination), {}, auth_admin_header
      response.status.should be(200)
    end
  end
end
