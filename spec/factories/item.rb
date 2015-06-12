FactoryGirl.define do

  factory :item do
  	qty Kernel::rand(1..10)
		description Faker::Lorem.sentence
    price Kernel::rand(1..50)
		total 20
		association :invoice, factory: :invoice
		association :item_kind, factory: :item_kind
  end
end
