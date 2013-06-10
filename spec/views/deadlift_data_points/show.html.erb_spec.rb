require 'spec_helper'

describe "deadlift_data_points/show" do
  before(:each) do
    @deadlift_data_point = assign(:deadlift_data_point, stub_model(DeadliftDataPoint))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
