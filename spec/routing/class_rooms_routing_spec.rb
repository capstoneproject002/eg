require "spec_helper"

describe ClassRoomsController do
  describe "routing" do

    it "routes to #index" do
      get("/class_rooms").should route_to("class_rooms#index")
    end

    it "routes to #new" do
      get("/class_rooms/new").should route_to("class_rooms#new")
    end

    it "routes to #show" do
      get("/class_rooms/1").should route_to("class_rooms#show", :id => "1")
    end

    it "routes to #edit" do
      get("/class_rooms/1/edit").should route_to("class_rooms#edit", :id => "1")
    end

    it "routes to #create" do
      post("/class_rooms").should route_to("class_rooms#create")
    end

    it "routes to #update" do
      put("/class_rooms/1").should route_to("class_rooms#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/class_rooms/1").should route_to("class_rooms#destroy", :id => "1")
    end

  end
end
