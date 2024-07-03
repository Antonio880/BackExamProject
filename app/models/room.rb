class Room < ApplicationRecord
  belongs_to :created_by, class_name: 'User'
  has_many :users
  has_many :exams

  validates :serie, presence: true
  validates :curso, presence: true
end
