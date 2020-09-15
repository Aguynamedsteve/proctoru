class Exam < ApplicationRecord
  has_one :exam_window

  validates_presence_of :title
end
