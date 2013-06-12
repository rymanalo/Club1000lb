require 'spec_helper'

describe "bench_press_data_points/show" do
  before(:each) do
    @bench_press_data_point = assign(:bench_press_data_point, stub_model(BenchPressDataPoint,
      :user_id => 1,
      :data_point => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
