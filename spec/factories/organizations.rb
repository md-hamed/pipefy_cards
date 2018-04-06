FactoryBot.define do
  factory :organization do
    name { Faker::Name.name }
    pipefy_id { Faker::Number.unique.number(5) }
  end
end
