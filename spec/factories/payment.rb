FactoryGirl.define do

  factory :payment do
    amount Kernel::rand(500..3000)
    date DateTime.now.beginning_of_day
		note Faker::Lorem.sentence
  end
end

