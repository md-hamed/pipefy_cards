FactoryBot.define do
  factory :card do
    pipefy_id { Faker::Number.unique.number(5) }
    name { Faker::Name.name }
    fields []
    phase
  end
end
