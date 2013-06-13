class BenchPressDataPoint < ActiveRecord::Base
  attr_accessible :weight, :user_id, :date
  attr_reader :created_at

  belongs_to :user
end
