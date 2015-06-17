FactoryGirl.define do

  factory :payment do
    amount Kernel::rand(500..3000).to_s
    date '2015-06-17T00:00:00+01:00'
		note Faker::Lorem.sentence
    association :invoice
  end
end

