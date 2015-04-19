class Client
	include Mongoid::Document
	include Mongoid::Timestamps

	belongs_to :organisation

	field :contact_type, type: Boolean
	field :first_name, type: String
	field :last_name, type: String
	field :email, type: String
	field :tel, type: Integer
	field :note, type: String
end