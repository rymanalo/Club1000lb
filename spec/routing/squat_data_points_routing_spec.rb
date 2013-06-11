require "spec_helper"

describe SquatDataPointsController do
  describe "routing" do

    it "routes to #index" do
      get("/squat_data_points").should route_to("squat_data_points#index")
    end

    it "routes to #new" do
      get("/squat_data_points/new").should route_to("squat_data_points#new")
    end

    it "routes to #show" do
      get("/squat_data_points/1").should route_to("squat_data_points#show", :id => "1")
    end

    it "routes to #edit" do
      get("/squat_data_points/1/edit").should route_to("squat_data_points#edit", :id => "1")
    end

    it "routes to #create" do
      post("/squat_data_points").should route_to("squat_data_points#create")
    end

    it "routes to #update" do
      put("/squat_data_points/1").should route_to("squat_data_points#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/squat_data_points/1").should route_to("squat_data_points#destroy", :id => "1")
    end

  end
end
