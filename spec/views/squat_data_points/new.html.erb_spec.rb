require 'spec_helper'

describe "squat_data_points/new" do
  before(:each) do
    assign(:squat_data_point, stub_model(SquatDataPoint,
      :user_id => 1,
      :data_point => 1
    ).as_new_record)
  end

  it "renders new squat_data_point form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", squat_data_points_path, "post" do
      assert_select "input#squat_data_point_user_id[name=?]", "squat_data_point[user_id]"
      assert_select "input#squat_data_point_data_point[name=?]", "squat_data_point[data_point]"
    end
  end
end
