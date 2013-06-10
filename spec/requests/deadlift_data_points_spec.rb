require 'spec_helper'

describe "DeadliftDataPoints" do
  describe "GET /deadlift_data_points" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get deadlift_data_points_path
      response.status.should be(200)
    end
  end
end
