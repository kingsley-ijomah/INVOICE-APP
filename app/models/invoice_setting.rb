class InvoiceSetting
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :value, type: String
end
