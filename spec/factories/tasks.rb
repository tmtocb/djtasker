FactoryBot.define do
  factory :task do
    title { "MyString" }
    description { "MyText" }
    company { "MyString" }
    url { "MyString" }
    category_id { 1 }
  end
end
