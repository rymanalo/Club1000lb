require 'spec_helper'

describe "deadlift_data_points/index" do
  before(:each) do
    assign(:deadlift_data_points, [
      stub_model(DeadliftDataPoint),
      stub_model(DeadliftDataPoint)
    ])
  end

  it "renders a list of deadlift_data_points" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
