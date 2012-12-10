class HomeController < ApplicationController
  def index
    redirect_to destinations_path
  end
end
