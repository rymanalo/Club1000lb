require 'spec_helper'

describe "deadlift_data_points/new" do
  before(:each) do
    assign(:deadlift_data_point, stub_model(DeadliftDataPoint).as_new_record)
  end

  it "renders new deadlift_data_point form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", deadlift_data_points_path, "post" do
    end
  end
end
