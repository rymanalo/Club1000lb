class Club1000lbController < ApplicationController
  before_filter :authenticate_user!


  def index
    deadlift_data_points = DeadliftDataPoint.where("user_id = '#{current_user.id}'")
    @max_deadlift = (deadlift_data_points.map {|point| point['weight']}).max || 0

    squat_data_points = SquatDataPoint.where("user_id = '#{current_user.id}'")
    @max_squat = (squat_data_points.map {|point| point['weight']}).max || 0

    bench_press_data_points = BenchPressDataPoint.where("user_id = '#{current_user.id}'")
    @max_bench_press = (bench_press_data_points.map {|point| point['weight']}).max || 0

    @total_max = @max_deadlift + @max_squat + @max_bench_press
  end

end
