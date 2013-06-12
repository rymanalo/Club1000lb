require "spec_helper"

describe BenchPressDataPointsController do
  describe "routing" do

    it "routes to #index" do
      get("/bench_press_data_points").should route_to("bench_press_data_points#index")
    end

    it "routes to #new" do
      get("/bench_press_data_points/new").should route_to("bench_press_data_points#new")
    end

    it "routes to #show" do
      get("/bench_press_data_points/1").should route_to("bench_press_data_points#show", :id => "1")
    end

    it "routes to #edit" do
      get("/bench_press_data_points/1/edit").should route_to("bench_press_data_points#edit", :id => "1")
    end

    it "routes to #create" do
      post("/bench_press_data_points").should route_to("bench_press_data_points#create")
    end

    it "routes to #update" do
      put("/bench_press_data_points/1").should route_to("bench_press_data_points#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bench_press_data_points/1").should route_to("bench_press_data_points#destroy", :id => "1")
    end

  end
end
