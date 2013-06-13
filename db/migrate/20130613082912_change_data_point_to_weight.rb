class ChangeDataPointToWeight < ActiveRecord::Migration
  def change
    add_column :bench_press_data_points, :weight, :integer
    add_column :squat_data_points, :weight, :integer
    add_column :deadlift_data_points, :weight, :integer

    remove_column :bench_press_data_points, :data_point, :integer
    remove_column :squat_data_points, :data_point, :integer
    remove_column :deadlift_data_points, :data_point, :integer
  end
end
