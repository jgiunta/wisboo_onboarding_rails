module RequestHelper
  def body
    ActiveSupport::JSON.decode(response.body) if response.present?
  end
end
