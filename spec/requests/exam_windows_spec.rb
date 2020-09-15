require 'rails_helper'

RSpec.describe "ExamWindows", type: :request do
  describe "GET /exam_windows" do
    it "works! (now write some real specs)" do
      get exam_windows_path
      expect(response).to have_http_status(200)
    end
  end
end
