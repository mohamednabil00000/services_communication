# frozen_string_literal: true

class Payment < ApplicationRecord
  validates :amount, presence: true
  validates :currency, presence: true
  validates :user_id, presence: true

  enum currency: [ :usd, :euro, :gbp ]
end
