# frozen_string_literal: true

class CreatePayments < ActiveRecord::Migration[7.2]
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.decimal :amount
      t.string :currency, default: "usd"

      t.timestamps
    end
  end
end
