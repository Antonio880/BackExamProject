FactoryBot.define do
  factory :exam do
    category { "MyString" }
    question_count { 1 }
    created_by { nil }
    room { nil }
  end
end
