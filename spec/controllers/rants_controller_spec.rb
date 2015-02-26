require 'rails_helper'
require 'pp'

RSpec.describe RantsController, type: :controller do
  describe "#index" do
    it "returns json of all the rants" do
      user = create_user
      rant = create_rant(user_id: user.id)

      get :index, user_id: user.id

      expect(response.status).to be(200)
      response_array = JSON.parse(response.body)["rants"]
      expect(response_array[0]["title"]).to eq(rant.title)
    end
  end

  describe "#show" do
    it "returns the json of all user1 rants" do
    user = create_user
    rant1 = create_rant(user_id: user.id)
    rant2 = create_rant(user_id: user.id)

    get :show, user_id: user.id, id: rant1.id

    expect(response.status).to be(200)
    response_array = JSON.parse(response.body)["rants"]
    expect(response_array[0]["title"]).to eq(rant1.title)
    end
  end

  describe "#update" do
    it "returns the json of an updated user rant" do
      user = create_user
      rant = create_rant(user_id: user.id)

      patch :update, user_id: user.id, id: rant.id, rant: {title: 'Oh No'}

      expect(response.status).to be(200)
      response_array = JSON.parse(response.body)["rants"]
      expect(rant.reload.title).to eq("Oh No")
    end
  end

  describe "#delete" do
    it "deletes a users rant" do
      user = create_user
      rant1 = create_rant(user_id: user.id)
      rant2 = create_rant(user_id: user.id)

      delete :destroy, user_id: user.id, id: rant1.id

      expect(Rant.count).to eq(1)
    end
  end
end
