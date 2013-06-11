class CreateSquatDataPoints < ActiveRecord::Migration
  def change
    create_table :squat_data_points do |t|
      t.integer :user_id
      t.integer :data_point

      t.timestamps
    end
  end
end
