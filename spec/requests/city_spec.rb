require 'rails_helper'

RSpec.describe "Cities", type: :request do
  describe "GET /index" do
    it "succeeds" do
      get city_index_path
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    let (:city) { create(:city) }
    it "succeeds" do
      get city_path(city)
      expect(response).to be_successful
    end
  end
end
