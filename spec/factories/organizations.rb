FactoryBot.define do
  factory :organization do
    name { Faker::Company.name }
    pipefy_id { Faker::Number.unique.number(5) }

    trait :with_cards do
      after(:create) do |organization|
        pipe = create(:pipe, organization: organization)
        phases = create_list(:phase, 5, pipe: pipe)
        create_list(:card, 3, phase: phases.first)
      end
    end
  end
end
