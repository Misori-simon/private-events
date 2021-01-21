require 'rails_helper'

RSpec.describe "Invitations", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/invitation/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/invitation/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end