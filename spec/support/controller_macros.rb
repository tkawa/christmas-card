module ControllerMacros
  def auth_admin
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials('admin', 'hogehoge')
  end
end
