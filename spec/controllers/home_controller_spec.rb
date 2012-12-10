require 'spec_helper'

describe HomeController do
  describe "GET 'index'" do
    context 'with auth' do
      before do
        auth_admin
      end

      it "returns http success" do
        get 'index'
        response.should redirect_to destinations_path
      end
    end

    context 'without auth' do
      it "requires auth" do
        get 'index'
        response.status.should be 401
      end
    end
  end

end
