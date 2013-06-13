class DeadliftDate < ActiveRecord::Migration
  def up
    add_column :deadlift_data_points, :date, :string
  end

  def down
  end
end
