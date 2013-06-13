class SquatDataPoint < ActiveRecord::Base
  attr_accessible :data_point, :user_id, :date
  attr_reader :created_at

  belongs_to :user
end

