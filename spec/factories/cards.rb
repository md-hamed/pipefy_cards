FactoryBot.define do
  factory :card do
    pipefy_id { Faker::Number.unique.number(5) }
    title { Faker::Lorem.sentence }
    fields []
    due_at { Faker::Time.forward }
    created_on_pipefy_at { Faker::Time.backward }
    phase
  end
end
