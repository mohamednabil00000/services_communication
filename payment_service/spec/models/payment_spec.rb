# frozen_string_literal: true

require "rails_helper"

RSpec.describe Payment, type: :model do
  describe "validations" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:currency) }
  end
end
