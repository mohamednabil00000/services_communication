# frozen_string_literal: true

require "sneakers"
Sneakers.configure(
    connection: Bunny.new(
    addresses: ENV.fetch("RABBITMQ_HOST", "127.0.0.1:5672"),
    username: "guest",
    password: "guest",
    vhost: "/",
    logger: Rails.logger
  ),
 amqp: ENV.fetch("RABBITMQ_URL", "amqp://guest:guest@localhost:5672"),
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
