require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #Matchup" do
    it "returns http success" do
      get :Matchup
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #Results" do
    it "returns http success" do
      get :Results
      expect(response).to have_http_status(:success)
    end
  end

end
