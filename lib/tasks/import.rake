require 'csv'

namespace :import do

  desc "Import merchants from csv"
    task merchants: :environment do
      filename = "./db/csv/merchants.csv"
    CSV.foreach(filename, headers: true) do |row|
      Merchant.create(row.to_hash)
      #   :id => row[0],
      #   :name => row[1],
      #   :created_at => row[2],
      #   :updated_at => row[3]
      # )
    end
  end


  desc "Import customers from csv"
    task customers: :environment do
    filename = "./db/csv/customers.csv"
    CSV.foreach(filename, headers: true) do |row|
    Customer.create(row.to_hash)
    #   :id => row[0],
    #   :first_name => row[1],
    #   :last_name => row[2],
    #   :created_at => row[3],
    #   :updated_at => row[4]
    # )
    end
  end

  desc "Import items from csv"
    task items: :environment do
    filename = "./db/csv/items.csv"
    CSV.foreach(filename, headers: true) do |row|
    Item.create(row.to_hash)
    #   :id => row[0],
    #   :name => row[1],
    #   :description => row[2],
    #   :unit_price => row[3],
    #   :merchant_id => row[4],
    #   :created_at => row[5],
    #   :updated_at => row[6]
    # )
    end
  end

  desc "Import invoices from csv"
    task invoices: :environment do
    filename = "./db/csv/invoices.csv"
    CSV.foreach(filename, headers: true) do |row|
    Invoice.create(row.to_hash)
    #   :id => row[0],
    #   :customer_id => row[1],
    #   :merchant_id => row[2],
    #   :status => row[3],
    #   :created_at => row[4],
    #   :updated_at => row[5]
    # )
    end
  end

  desc "Import invoice_items from csv"
    task invoice_items: :environment do
    filename = "./db/csv/invoice_items.csv"
    CSV.foreach(filename, headers: true) do |row|
    InvoiceItem.create(row.to_hash)
    #   :id => row[0],
    #   :invoice_id => row[1],
    #   :quantity => row[2],
    #   :unit_price => row[3],
    #   :created_at => row[4],
    #   :updated_at => row[5]
    # )
    end
  end

  desc "Import transactions from csv"
    task transactions: :environment do
    filename = "./db/csv/transactions.csv"
    CSV.foreach(filename, headers: true) do |row|
    Transaction.create(row.to_hash)
    #   :id => row[0],
    #   :invoice_id => row[1],
    #   :credit_card_number => row[2],
    #   :credit_card_expiration_date => row[3],
    #   :result => row[4],
    #   :created_at => row[5],
    #   :updated_at => row[6]
    # )
    end
  end
end
