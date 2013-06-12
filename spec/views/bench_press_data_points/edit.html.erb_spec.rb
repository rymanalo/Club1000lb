require 'spec_helper'

describe "bench_press_data_points/edit" do
  before(:each) do
    @bench_press_data_point = assign(:bench_press_data_point, stub_model(BenchPressDataPoint,
      :user_id => 1,
      :data_point => 1
    ))
  end

  it "renders the edit bench_press_data_point form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bench_press_data_point_path(@bench_press_data_point), "post" do
      assert_select "input#bench_press_data_point_user_id[name=?]", "bench_press_data_point[user_id]"
      assert_select "input#bench_press_data_point_data_point[name=?]", "bench_press_data_point[data_point]"
    end
  end
end
