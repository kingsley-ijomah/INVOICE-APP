class Client
	include Mongoid::Document
	include Mongoid::Timestamps

	belongs_to :organisation
	# has_many :invoices

	validates :contact_type, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :tel, presence: true

	field :contact_type, type: Boolean
	field :first_name, type: String
	field :last_name, type: String
	field :email, type: String
	field :tel, type: String
	field :note, type: String
end