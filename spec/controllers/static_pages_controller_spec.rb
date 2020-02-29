require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe "static_pages#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "should not consider @album to be true until @chosen_country is true" do
      @chosen_country == nil
      expect(@album). to eq(nil)
    end
  end

end
