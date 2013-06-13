class AddDateToModels < ActiveRecord::Migration
  def change
    add_column :bench_press_data_points, :date, :string
    add_column :squat_data_points, :date, :string
  end
end
