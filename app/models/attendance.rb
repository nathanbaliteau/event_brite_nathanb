class Attendance < ApplicationRecord

  belongs_to :customer, class_name: 'User'
  belongs_to :event

  after_create :inform_admin

  def inform_admin
    UserMailer.new_participant_email(self).deliver_now
  end
end
