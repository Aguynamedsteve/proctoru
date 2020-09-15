require 'rails_helper'

RSpec.describe "ApiRequests", type: :request do
  describe "GET /api_requests" do
    it "works! (now write some real specs)" do
      get api_requests_path
      expect(response).to have_http_status(200)
    end
  end
end
