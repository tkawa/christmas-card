require 'spec_helper'

describe "Members" do
  describe "GET /members" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get members_path, {}, auth_admin_header
      response.status.should be(200)
    end
  end
end
