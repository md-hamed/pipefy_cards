FactoryBot.define do
  factory :phase do
    pipefy_id { Faker::Number.unique.number(5) }
    name { Faker::Lorem.word }
    fields []
    pipe
  end
end
