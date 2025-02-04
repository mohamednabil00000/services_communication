# frozen_string_literal: true

class Api::PaymentsController < Api::BaseController
  def index
    render json: Payment.all
  end
end
