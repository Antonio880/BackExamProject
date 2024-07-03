class ExamQuestion < ApplicationRecord
  belongs_to :exam
  serialize :answers, JSON
  serialize :correct_answers, JSON
end
