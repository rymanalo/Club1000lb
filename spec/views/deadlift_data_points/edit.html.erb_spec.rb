require 'spec_helper'

describe "deadlift_data_points/edit" do
  before(:each) do
    @deadlift_data_point = assign(:deadlift_data_point, stub_model(DeadliftDataPoint))
  end

  it "renders the edit deadlift_data_point form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", deadlift_data_point_path(@deadlift_data_point), "post" do
    end
  end
end
