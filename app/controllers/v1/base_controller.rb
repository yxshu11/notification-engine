class V1::BaseController < ApplicationController
  before_action :authenticate_token

  def authenticate_token
    render json: { error: "Invalid API Key" }, status: 401 unless api_key_valid?
  end

  private

  def api_key_valid?
    api_key.present? && api_key.eql?(ENV['NOTIFICATION_ENGINE_API_KEY'])
  end

  def api_key
    request.headers['X-Api-Key']
  end
end
