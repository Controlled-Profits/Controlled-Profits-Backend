require 'rails_helper'
require 'spec_helper'

RSpec.describe BusinessesController, type: :controller do

  describe "POST #create" do
    before(:each) do      
        @business = FactoryGirl.create(:business) 
        @user=create(:user)
        sign_in @user
    end
    def trigger
      post :create, @business.attributes
    end

    def clean
      Business.destroy(@business.id)
    end

    it "returns http success" do
      trigger
      expect(response).to have_http_status(:success)
      clean
    end

    it "respond body JSON with attributes" do
      trigger
      expect(response.body).to look_like_json
      expect(body_as_json).to be_kind_of(Hash)
      clean
    end

    it "creates entry in table" do
      before_count = Business.count
      trigger
      expect(Business.count).to_not eq (before_count)
      clean
    end

    it "renders correct business attributes" do
      # we are not stubbing we will just make sure the Serializer is called
      trigger
      expect(body_as_json).to eq @business
      clean
    end
  end
end