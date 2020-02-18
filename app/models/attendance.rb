class Attendance < ApplicationRecord

  belongs_to :customer, class_name: 'User'
  belongs_to :event

end
