FactoryBot.define do
  factory :product do
    name { Faker::Book.title }
    image { Faker::LoremFlickr.image }
    quantity { 1 }
    description { Faker::Lorem.sentence(5) }
  end
end
