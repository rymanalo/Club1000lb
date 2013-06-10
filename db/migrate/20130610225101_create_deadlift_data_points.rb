class CreateDeadliftDataPoints < ActiveRecord::Migration
  def change
    create_table :deadlift_data_points do |t|

      t.timestamps
    end
  end
end
