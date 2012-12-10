module RequestMacros
  def auth_admin_header
    { 'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials('admin', 'hogehoge') }
  end
end
