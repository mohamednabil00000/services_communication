# frozen_string_literal: true

require "sneakers"
Sneakers.configure(
    connection: Bunny.new(
    addresses: "127.0.0.1:5672",
    username: "guest",
    password: "guest",
    vhost: "/",
    logger: Rails.logger
  ),
 exchange: "crawler.payments",
 exchange_type: :fanout,
 workers: 1,
 durable: false,
 conn_per_thread: true,
 ack: true,
 heartbeat: 60
)
Sneakers.logger = Rails.logger
Sneakers.logger.level = Logger::WARN
