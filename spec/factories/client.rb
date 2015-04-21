FactoryGirl.define do

  factory :client do
    contact_type [true, false].sample
		first_name Faker::Name.first_name
		last_name Faker::Name.last_name
		email Faker::Internet.email
		tel Faker::PhoneNumber.phone_number
		note Faker::Lorem.sentence
		association :organisation, factory: :organisation
  end
end