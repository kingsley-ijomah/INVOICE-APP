class Item
	include Mongoid::Document
	include Mongoid::Timestamps

	belongs_to :invoice
	belongs_to :item_kind

	field :qty, type: Integer
	field :kind, type: String
	field :description, type: String
	field :price, type: String
	field :total, type: String
end