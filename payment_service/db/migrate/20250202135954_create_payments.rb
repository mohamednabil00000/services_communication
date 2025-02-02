# frozen_string_literal: true

class CreatePayments < ActiveRecord::Migration[7.2]
  def change
    create_table :payments do |t|
      t.integer :user_id, null: false
      t.decimal :amount, default: 0.0
      t.string :currency, default: 'usd'

      t.timestamps
    end
  end
end
