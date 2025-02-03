# frozen_string_literal: true

class PaymentsWorker
  include Sneakers::Worker

  from_queue "dashboard.payments", env: Rails.env
  def work(raw_payment)
    Payment.create!(JSON.parse raw_payment)
    ack!
  end
end
