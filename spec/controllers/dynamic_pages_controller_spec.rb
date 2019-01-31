require 'rails_helper'

RSpec.describe DynamicPagesController, type: :controller do

  describe "GET #matchups" do
    it "returns http success" do
      get :matchups
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #results" do
    it "returns http success" do
      get :results
      expect(response).to have_http_status(:success)
    end
  end

end
