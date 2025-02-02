# frozen_string_literal: true

class Api::PaymentsController < Api::BaseController
  def publish
    Publisher.publish('payments', publish_params)
    render json: { message: "send payment successfully!" }
  rescue StandardError => e
    # Log error
    render json: { message: "send payment failed!" }
  end

  def publish_params
    params.permit(:user_id, :amount, :currency)
  end
end
