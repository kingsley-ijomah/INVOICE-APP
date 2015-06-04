class Invoice
	include Mongoid::Document
	include Mongoid::Timestamps

	belongs_to :organisation
	belongs_to :client
  belongs_to :company
	has_many :items, autosave: true

	field :number, type: String
	field :date_of_issue, type: DateTime
	field :po_number, type: String
	field :discount, type: Integer
	field :note, type: String
  field :terms, type: String

	validates :number, presence: true
  validates :date_of_issue, presence: true
  validates :terms, presence: true
end
