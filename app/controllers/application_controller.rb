class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_r
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_r
  private
  def invalid_r(e)
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end
  def not_found_r(e)
    render json: { error: "#{e.model} not found" }, status: :not_found
  end
end
