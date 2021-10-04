# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ActionController::Serialization
  include Pundit
  include Authentication

  protect_from_forgery with: :null_session

  serialization_scope :current_user
  respond_to :json

  rescue_from Pundit::NotAuthorizedError, with: :not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::ParameterMissing, with: :parameter_missing
  rescue_from Exceptions::UnauthorizedError, with: :not_authenticated

  before_action :authenticate_user

  def index
    render nothing: true, status: :ok
  end

  def me
    render json: current_user, status: :ok
  end

  protected

  def metadata
    {
      page_number: records.current_page,
      total_record_count: records.total_count,
      page_size: records.total_pages
    }
  end

  # Handlers for API errors
  def parameter_missing(parameter_missing_exception)
    render json: {
      errors: { parameter_missing_exception.param => I18n.t('errors.messages.blank') }
    },
           status: :bad_request
  end

  def record_not_found
    render json: {}, status: :not_found
  end

  def not_authorized
    render json: {}, status: :forbidden
  end

  def not_authenticated
    render json: {}, status: :unauthorized
  end
end
