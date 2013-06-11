class AddDataPointsToDeadlifts < ActiveRecord::Migration
  def change
    add_column :deadlift_data_points, :user_id, :integer
    add_column :deadlift_data_points, :data_point, :integer

  end
end
