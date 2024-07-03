class Exam < ApplicationRecord
  belongs_to :room
  belongs_to :created_by, class_name: 'User'
  has_many :exam_questions, dependent: :destroy

  accepts_nested_attributes_for :exam_questions
end
