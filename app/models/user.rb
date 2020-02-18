class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, length: { maximum: 500}
  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }

  has_many :attendances, foreign_key: 'customer_id'
  has_many :events, through: :attendances
  has_many :admin_events, class_name: 'Event', foreign_key: 'admin_id'
end
