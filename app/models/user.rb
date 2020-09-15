class User < ApplicationRecord
  belongs_to :college
  belongs_to :exam

  validates_presence_of :first_name, :last_name
end
