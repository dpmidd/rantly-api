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
end
