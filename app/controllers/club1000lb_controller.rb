class Club1000lbController < ApplicationController
  before_filter :authenticate_user!, :except => [:welcome]



  def index
    deadlift_data_points = DeadliftDataPoint.where("user_id = '#{current_user.id}'")
    @max_deadlift = (deadlift_data_points.map {|point| point['weight']}).max || 0
    @last_max_deadlift = (deadlift_data_points == []) ? 0 : deadlift_data_points.last['weight']

    squat_data_points = SquatDataPoint.where("user_id = '#{current_user.id}'")
    @max_squat = (squat_data_points.map {|point| point['weight']}).max || 0
    @last_max_squat = (squat_data_points == []) ? 0 : squat_data_points.last['weight']

    bench_press_data_points = BenchPressDataPoint.where("user_id = '#{current_user.id}'")
    @max_bench_press = (bench_press_data_points.map {|point| point['weight']}).max || 0
    @last_max_bench_press = (bench_press_data_points == []) ? 0 : bench_press_data_points.last['weight']

    @total_max = @max_deadlift + @max_squat + @max_bench_press
    @current_total_max = @last_max_deadlift + @last_max_squat + @last_max_bench_press
    @current_total_max_hash = [{"Max Weight" => @max_deadlift,"Current Max" => @last_max_deadlift, name: "Deadlift"},
                               {"Max Weight" => @max_squat,"Current Max" => @last_max_squat, name: "Squat"},
                               {"Max Weight" => @max_bench_press,"Current Max" => @last_max_bench_press, name: "Bench Press"},
                               {"Max Weight" => @total_max,"Current Max" => @current_total_max, name: "Total"}]


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @current_total_max_hash }
    end
  end

  def welcome
    if user_signed_in?
      redirect_to :action => "index"
    end
  end


end
