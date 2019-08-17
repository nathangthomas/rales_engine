class Customer < ApplicationRecord
  has_many :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    Merchant.select("merchants.*, count(invoices.merchant_id) as merchant_count").joins(invoices: :transactions).where(invoices: {customer_id: id }).where("transactions.result = ?", "success").group("merchants.id").order("merchant_count desc").first
  end

end
