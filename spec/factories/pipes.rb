FactoryBot.define do
  factory :pipe do
    pipefy_id { Faker::Number.unique.number(5) }
    name { Faker::Name.name }
    start_form_fields []
    organization
  end
end
