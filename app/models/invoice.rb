class Invoice
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :organisation
  belongs_to :client
  belongs_to :company
  has_many :items, autosave: true

  field :number, type: Integer
  field :date_of_issue, type: DateTime
  field :po_number, type: String
  field :discount, type: Integer
  field :note, type: String
  field :terms, type: String
  field :total, type: Float

  validates :number, presence: true
  validates :date_of_issue, presence: true
  validates :terms, presence: true

  def calculate_items_totals
    self.items.sum :total
  end

  def update_total
    self.total = calculate_items_totals
    self.save
  end

  def self.total
    Invoice.all.sum :total
  end

end
