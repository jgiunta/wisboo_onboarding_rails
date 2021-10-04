# frozen_string_literal: true

module Authentication
  extend ActiveSupport::Concern
  included do
    include ActionController::HttpAuthentication::Basic::ControllerMethods
    attr_reader :current_user
  end

  def logged_in?
    current_user.present?
  end

  def authenticate_user
    authenticate_or_request_with_http_basic do |username, password|
      @current_user = User.authenticate(username, password)
      raise Exceptions::UnauthorizedError if current_user.blank?
      true
    end
  end
end
