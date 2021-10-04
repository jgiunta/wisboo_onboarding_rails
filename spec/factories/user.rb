FactoryBot.define do
  factory :user do |f|
    f.email { Faker::Internet.email }
    f.password { Faker::Internet.password(8) }
    f.name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.role { 'basic' }
  end
end
