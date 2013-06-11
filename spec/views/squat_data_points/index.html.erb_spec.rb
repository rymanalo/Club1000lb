require 'spec_helper'

describe "squat_data_points/index" do
  before(:each) do
    assign(:squat_data_points, [
      stub_model(SquatDataPoint,
        :user_id => 1,
        :data_point => 2
      ),
      stub_model(SquatDataPoint,
        :user_id => 1,
        :data_point => 2
      )
    ])
  end

  it "renders a list of squat_data_points" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
