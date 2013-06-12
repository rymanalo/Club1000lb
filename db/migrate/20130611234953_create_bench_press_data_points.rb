class CreateBenchPressDataPoints < ActiveRecord::Migration
  def change
    create_table :bench_press_data_points do |t|
      t.integer :user_id
      t.integer :data_point

      t.timestamps
    end
  end
end
