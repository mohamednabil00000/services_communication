# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::PaymentsController, type: :controller do
  describe "Get #index" do
    context "when there are no payments" do
      it "returns empty response" do
        get :index
        expect(response).to have_http_status(:ok)
        expect(response.parsed_body.empty?).to be_truthy
      end
    end

    context "when there are payments" do
      let!(:payments) { create(:payment) }
      let(:expected_response) do
        [
          {
            "id" => payments.id,
            "user_id" => payments.user_id,
            "amount" => payments.amount.to_s,
            "currency" => payments.currency,
            "created_at" => payments.created_at.as_json,
            "updated_at" => payments.updated_at.as_json
          }
        ]
      end

      it "returns non empty response" do
        get :index
        expect(response).to have_http_status(:ok)
        expect(response.parsed_body).to eq(expected_response)
      end
    end
  end
end
