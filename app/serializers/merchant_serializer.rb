class MerchantSerializer
  include FastJsonapi::ObjectSerializer
  has_many :items
  has_many :invoices
  # has_many :customers, through: :invoices
  has_many :customers
  has_many :invoices 

  attributes :id, :name

end
