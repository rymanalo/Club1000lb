class Club1000lbController < ApplicationController
  before_filter :authenticate_user!


  def index
    deadlift_data_points = DeadliftDataPoint.where("user_id = '#{current_user.id}'")
    @max_deadlift = (deadlift_data_points.map {|point| point['data_point']}).max

    squat_data_points = SquatDataPoint.where("user_id = '#{current_user.id}'")
    @max_squat = (squat_data_points.map {|point| point['data_point']}).max


  end

end
