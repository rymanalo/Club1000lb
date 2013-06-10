require "spec_helper"

describe DeadliftDataPointsController do
  describe "routing" do

    it "routes to #index" do
      get("/deadlift_data_points").should route_to("deadlift_data_points#index")
    end

    it "routes to #new" do
      get("/deadlift_data_points/new").should route_to("deadlift_data_points#new")
    end

    it "routes to #show" do
      get("/deadlift_data_points/1").should route_to("deadlift_data_points#show", :id => "1")
    end

    it "routes to #edit" do
      get("/deadlift_data_points/1/edit").should route_to("deadlift_data_points#edit", :id => "1")
    end

    it "routes to #create" do
      post("/deadlift_data_points").should route_to("deadlift_data_points#create")
    end

    it "routes to #update" do
      put("/deadlift_data_points/1").should route_to("deadlift_data_points#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/deadlift_data_points/1").should route_to("deadlift_data_points#destroy", :id => "1")
    end

  end
end
