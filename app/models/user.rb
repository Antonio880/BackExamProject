class User < ApplicationRecord
  has_secure_password
  belongs_to :room, optional: true
  has_many :created_rooms, class_name: 'Room', foreign_key: 'created_by_id'
  has_many :exams, foreign_key: 'created_by_id'

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true
  validates :password, presence: true, on: :create
end
