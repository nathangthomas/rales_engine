class InvoiceSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :customer
  belongs_to :merchant

  has_many :invoice_items
  # has_many :items, through: :invoice_items
  has_many :items
  has_many :invoice_items
  #all the serializer does is set up static JSon in strings 

  attributes :id, :status
end
