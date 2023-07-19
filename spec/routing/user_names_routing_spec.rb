require "rails_helper"

RSpec.describe UserNamesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/user_names").to route_to("user_names#index")
    end

    it "routes to #new" do
      expect(get: "/user_names/new").to route_to("user_names#new")
    end

    it "routes to #show" do
      expect(get: "/user_names/1").to route_to("user_names#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/user_names/1/edit").to route_to("user_names#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/user_names").to route_to("user_names#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/user_names/1").to route_to("user_names#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/user_names/1").to route_to("user_names#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/user_names/1").to route_to("user_names#destroy", id: "1")
    end
  end
end
