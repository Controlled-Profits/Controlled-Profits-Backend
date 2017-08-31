# require 'rails_helper'
# require 'spec_helper'

# RSpec.describe V1::IncomesController do
#   describe "GET #show" do
#     def trigger
#       get :show, id: business.id
#     end

#     let(:business) { Business.create(user_id: 1, name: 'Test Business', naics: '0000', sic: '0000', ein: '77-8888888', tier: 1)) }

#     it "returns http success" do
#       trigger
#       expect(response).to have_http_status(:success)
#     end

#     it "respond body JSON with attributes" do
#       trigger
#       expect(response.body).to look_like_json
#       expect(body_as_json).to be_kind_of(Hash)
#     end

#     it "correct business attributes are rendered" do
#       # we are not stubbing we will just make sure the Serializer is called
#       expect_any_instance_of(BusinessSerializer)
#         .to receive(:as_json)
#         .and_call_original  # this will ensure the return value
#                             # is called as it would normaly do

#       trigger

#       business_id = body_as_json
#         .fetch(:business)
#         .fetch(:id)
#         .to_i

#       expect(business_id).to eq business.id
#     end
#   end
# end