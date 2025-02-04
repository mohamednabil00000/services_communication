# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::PaymentsController, type: :controller do
  describe "POST #publish" do
    before do
      expect(Publisher).to receive(:publish).once
    end

    it "returns a success response" do
      post :publish, params: { user_id: 1, amount: 100, currency: "usd" }
      expect(response).to have_http_status(:ok)
      expect(response.parsed_body["message"]).to eq("send payment successfully!")
    end
  end
end
