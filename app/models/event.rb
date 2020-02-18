class Event < ApplicationRecord
  
  validates :start_date, presence: true
  validate :start_date_cannot_be_in_the_past
  validates :duration, presence: true
  validate :duration_must_be_multiple_of_five
  validates :title, 
    presence: true,
    length: { in: 5..140 }
  validates :description, 
    presence: true,
    length: { in: 20..100 }
  validates :price, numericality: { 
    only_integer: true, 
    greater_than_or_equal_to: 1, 
    less_than_or_equal_to: 1000
  }
  validates :location, presence: true

  has_many :attendances
  has_many :customers, through: :attendances, class_name: 'User'
  belongs_to :admin, class_name: 'User'

private
  
  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "can't be in the past") if
      !start_date.blank? && start_date < Date.today
  end

  def duration_must_be_multiple_of_five
    errors.add(:duration, "must be a multiple of 5") unless 
      duration % 5 == 0 && duration > 0
  end

end
