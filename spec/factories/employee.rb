FactoryGirl.define do
  factory :employee do
    name { "#{Faker::Name.name}" }
    profile { "#{Faker::Lorem.sentences(1000)}" }
    age { rand(18..50) }
  end
end
