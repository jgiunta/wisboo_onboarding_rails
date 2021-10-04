module LoginHelper
  def login_user(email, password)
    credentials = Base64.encode64("#{email}:#{password}")
    request.headers['Authorization'] = "Basic #{credentials}"
  end

  def logout_user
    request.headers['Authorization'] = nil
  end
end
