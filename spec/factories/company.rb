FactoryGirl.define do
  factory :company do
	  name Faker::Company.name
		street_1 Faker::Address.street_name
		street_2 Faker::Address.secondary_address
		city Faker::Address.city
		town Faker::Address.state
		post_code Faker::Address.postcode
  end
end
