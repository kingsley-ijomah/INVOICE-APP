class InvoiceSetting
  include Mongoid::Document
  include Mongoid::Timestamps

  field :terms, type: String
  field :notes, type: String
end
