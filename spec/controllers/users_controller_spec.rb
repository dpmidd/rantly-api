require 'rails_helper'
require 'pp'

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

  describe "#show" do
    it "returns the json of the selected user" do
      user1 = create_user
      user2 = create_user

      get :show, id: user1.id

      expect(response.status).to be(200)
      response_array = JSON.parse(response.body)
      expect(response_array["first_name"]).to eq(user1.first_name)

      get :show, id: user2.id

      expect(response.status).to be(200)
      response_array = JSON.parse(response.body)
      expect(response_array["first_name"]).to eq(user2.first_name)
    end
  end

  describe "#update" do

  end

  describe "#destroy" do

  end
end
