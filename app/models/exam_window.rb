class ExamWindow < ApplicationRecord
  belongs_to :exam

  validates_presence_of :start_time, :end_time

  def falls_within_time_window? datetime
    datetime.between?( start_time, end_time )
  end
end
