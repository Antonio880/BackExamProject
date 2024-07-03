FactoryBot.define do
  factory :user do
    email { "MyString" }
    username { "MyString" }
    password_digest { "MyString" }
    role { "MyString" }
    room { nil }
  end
end
