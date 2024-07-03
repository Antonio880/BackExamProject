FactoryBot.define do
  factory :exam_question do
    exam { nil }
    question { "MyString" }
    description { "MyString" }
    answers { "" }
    correct_answers { "" }
    multiple_correct_answers { "MyString" }
    correct_answer { "MyString" }
    explanation { "MyString" }
    tip { "MyString" }
    category { "MyString" }
    difficulty { "MyString" }
  end
end
