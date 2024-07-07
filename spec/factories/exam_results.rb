FactoryBot.define do
  factory :exam_result do
    user { nil }
    exam { nil }
    score { 1 }
    total_questions { 1 }
  end
end
