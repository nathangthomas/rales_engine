require 'csv'

namespace :import do
  desc "Import merchants from csv"
    task merchants: :environment do
      filename = "./db/csv/merchants.csv"
    CSV.foreach(filename, headers: true) do |row|
      Merchant.create(row.to_h)
    end
  end
end

namespace :import do
  desc "Import customers from csv"
    task customers: :environment do
    filename = "./db/csv/customers.csv"
    CSV.foreach(filename, headers: true) do |row|
    Customer.create(row.to_h)
    end
  end
end

namespace :import do
  desc "Import items from csv"
    task items: :environment do
    filename = "./db/csv/items.csv"
    CSV.foreach(filename, headers: true) do |row|
    Item.create(row.to_h)
    end
  end
end

namespace :import do
  desc "Import invoices from csv"
    task invoices: :environment do
    filename = "./db/csv/invoices.csv"
    CSV.foreach(filename, headers: true) do |row|
    Invoice.create(row.to_h)
    end
  end
end

namespace :import do
  desc "Import invoice_items from csv"
    task invoice_items: :environment do
    filename = "./db/csv/invoice_items.csv"
    CSV.foreach(filename, headers: true) do |row|
    InvoiceItem.create(row.to_h)
    end
  end
end

namespace :import do
  desc "Import transactions from csv"
    task transactions: :environment do
    filename = "./db/csv/transactions.csv"
    CSV.foreach(filename, headers: true) do |row|
    Transaction.create(row.to_h)
    end
  end
end
