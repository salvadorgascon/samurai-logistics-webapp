require 'rails_helper'

RSpec.describe "Web::CustomerLists", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/web/customer_list/index"
      expect(response).to have_http_status(:success)
    end
  end

end
