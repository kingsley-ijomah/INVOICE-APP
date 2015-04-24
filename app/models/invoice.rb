class Invoice
	include Mongoid::Document
	include Mongoid::Timestamps

	belongs_to :organisation
	belongs_to :client

	field :number, type: String
	field :date_of_issue, type: Date
	field :po_number, type: String
	field :discount, type: Integer
	field :note, type: String

	validates :number, presence: true
  validates :date_of_issue, presence: true
end
