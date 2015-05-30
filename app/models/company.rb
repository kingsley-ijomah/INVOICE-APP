class Company
  include Mongoid::Document
  include Mongoid::Timestamps

  validates :name, presence: true
  validates :street_1, presence: true
  validates :city, presence: true
  validates :town, presence: true

  field :name, type: String
  field :street_1, type: String
  field :street_2, type: String
  field :city, type: String
  field :town, type: String
  field :post_code, type: String

  has_many :invoices
end
