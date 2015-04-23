FactoryGirl.define do
  factory :invoice do
    number Faker::Number.number(10)
		date_of_issue Faker::Time.between(2.days.ago, Time.now)
		po_number Faker::Number.number(3)
		discount Faker::Number.number(2)
		note Faker::Lorem.sentence
		association :client, factory: :client
		association :organisation, factory: :organisation
	end
end