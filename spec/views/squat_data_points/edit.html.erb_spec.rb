require 'spec_helper'

describe "squat_data_points/edit" do
  before(:each) do
    @squat_data_point = assign(:squat_data_point, stub_model(SquatDataPoint,
      :user_id => 1,
      :data_point => 1
    ))
  end

  it "renders the edit squat_data_point form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", squat_data_point_path(@squat_data_point), "post" do
      assert_select "input#squat_data_point_user_id[name=?]", "squat_data_point[user_id]"
      assert_select "input#squat_data_point_data_point[name=?]", "squat_data_point[data_point]"
    end
  end
end
