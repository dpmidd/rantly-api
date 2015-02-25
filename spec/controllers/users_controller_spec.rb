require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#index" do
    it "returns json of all the users" do
      user = create_user
      get :index
      expect(response.status).to be(200)
      response_array = JSON.parse(response.body)["users"]
      expect(response_array[0]["first_name"]).to eq(user.first_name)
    end
  end

  describe "#update" do
    pending
  end

  describe "#destroy" do
    pending
  end
end
