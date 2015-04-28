FactoryGirl.define do

  factory :item do
  	qty rand(1..10)
    kind ['hours', 'service', 'product', 'days', 'deposit', 'expenses'].sample
		description Faker::Lorem.sentence
		price Faker::Commerce.price
		total 20
		association :invoice, factory: :invoice
  end
end