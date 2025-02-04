# frozen_string_literal: true

require "sneakers/tasks"

namespace :rabbitmq do
  desc "Connect consumer to producer"
  task :setup do
    require "bunny"
    puts "helloe2222"
    conn = Bunny.new(ENV.fetch("RABBITMQ_URL", "amqp://guest:guest@localhost:5672")).tap(&:start)
    ch = conn.create_channel
    queue_payments = ch.queue("consumer.payments")
    # bind queue to exchange
    queue_payments.bind("producer.payments")
    conn.close
  end
end
