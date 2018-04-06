FactoryBot.define do
  factory :phase do
    pipefy_id { Faker::Number.unique.number(5) }
    name { Faker::Name.name }
    fields []
    pipe
  end
end
