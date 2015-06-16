class Payment
	include Mongoid::Document
	include Mongoid::Timestamps

	belongs_to :invoice

	validates :amount, presence: true
  validates :date, presence: true

	field :amount, type: Float
	field :date, type: DateTime
	field :note, type: String
end

