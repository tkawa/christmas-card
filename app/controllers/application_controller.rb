class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :basic_authenticate

  def basic_authenticate
    authenticate_or_request_with_http_basic('Application') do |name, password|
      name == 'admin' && password == 'hogehoge'
    end
  end
end
