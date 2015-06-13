class Item
	include Mongoid::Document
	include Mongoid::Timestamps

	belongs_to :invoice
	belongs_to :item_kind

	field :qty, type: Integer
	field :description, type: String
	field :price, type: Float
	field :total, type: Float

  before_save do
    self.total = self.price * self.qty
  end

	# used by ajax link in _form.html to increment
	# nested attributes index
	def self.index_increment
		@index ||= -1
		@index += 1
	end
end
