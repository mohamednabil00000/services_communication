# frozen_string_literal: true

require "bunny"
class Publisher
  class << self
    def publish(exchange, message = {})
      x = channel.fanout("crawler.#{exchange}")
      x.publish(message.to_json)
    end
    def channel
      @channel ||= connection.create_channel
    end
    def connection
      @connection ||= Bunny.new(ENV.fetch("RABBITMQ_URL", "amqp://guest:guest@localhost:5672")).tap(&:start)
    end
  end
end
