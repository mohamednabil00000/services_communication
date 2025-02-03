# frozen_string_literal: true

$redis = Redis::Namespace.new("dashboard:#{Rails.env}", redis: Redis.new)
