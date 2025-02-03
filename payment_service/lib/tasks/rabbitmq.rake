# frozen_string_literal: true

require "sneakers/tasks"

namespace :rabbitmq do
  desc "Connect consumer to producer"
  task :setup do
    require "bunny"
    puts "helloe2222"
    conn = Bunny.new.tap(&:start)
    ch = conn.create_channel
    queue_payments = ch.queue("consumer.payments")
    # bind queue to exchange
    queue_payments.bind("producer.payments")
    conn.close
  end
end
