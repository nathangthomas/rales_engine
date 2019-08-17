require 'rails_helper'
require 'pry'

describe "Customers API" do
  before :each do
    #merchants
    @merchant_1 = Merchant.create!(name: 'Lost Outpost')
    @merchant_2 = Merchant.create!(name: "Walt's Bike Shop")
    @merchant_3 = Merchant.create!(name: 'Pagan Mountaineering')
    @merchant_4 = Merchant.create!(name: 'Thai Tantic')
    #items
    @item_1 = @merchant_1.items.create!(name: 'Bow Drill', description: 'The best there is!', unit_price: 1.99)
    @item_2 = @merchant_2.items.create!(name: 'Seat', description: 'The most comortable seat there is!', unit_price: 87.99)
    @item_3 = @merchant_3.items.create!(name: 'Sterling Rope', description: "70 meter 9.5mm Sterling Rope. Color: Pink", unit_price: 169.99)
    @item_4 = @merchant_4.items.create!(name: 'Thai Food', description: 'The most delicious', unit_price: 5.69)
    #customers
    @customer_1 = Customer.create!(first_name: 'Nathan', last_name: 'Thomas')
    @customer_2 = Customer.create!(first_name: 'Camille', last_name: 'Terry-Thomas')
    #invoices
    @invoice_1 = @merchant_1.invoices.create!(customer_id: @customer_1.id, status: "shipped")
    @invoice_2 = @merchant_1.invoices.create!(customer_id: @customer_1.id, status: "shipped")
    @invoice_3 = @merchant_2.invoices.create!(customer_id: @customer_1.id, status: "shipped")
    @invoice_4 = @merchant_2.invoices.create!(customer_id: @customer_1.id, status: "shipped")
    @invoice_5 = @merchant_3.invoices.create!(customer_id: @customer_1.id, status: "shipped")
    @invoice_6 = @merchant_3.invoices.create!(customer_id: @customer_1.id, status: "shipped")
    @invoice_7 = @merchant_4.invoices.create!(customer_id: @customer_2.id, status: "shipped")
    @invoice_8 = @merchant_4.invoices.create!(customer_id: @customer_2.id, status: "shipped")
    #invoice_itmes
    @invoice_item_1 = @invoice_1.invoice_items.create!(item_id: @item_1.id, quantity: 1, unit_price: 1.99)
    @invoice_item_2 = @invoice_2.invoice_items.create!(item_id: @item_1.id, quantity: 1, unit_price: 1.99)
    @invoice_item_3 = @invoice_3.invoice_items.create!(item_id: @item_2.id, quantity: 1, unit_price: 1.99)
    @invoice_item_4 = @invoice_4.invoice_items.create!(item_id: @item_2.id, quantity: 1, unit_price: 1.99)
    @invoice_item_5 = @invoice_5.invoice_items.create!(item_id: @item_3.id, quantity: 1, unit_price: 1.99)
    @invoice_item_6 = @invoice_6.invoice_items.create!(item_id: @item_3.id, quantity: 1, unit_price: 87.99)
    @invoice_item_7 = @invoice_7.invoice_items.create!(item_id: @item_4.id, quantity: 1, unit_price: 169.99)
    @invoice_item_8 = @invoice_8.invoice_items.create!(item_id: @item_4.id, quantity: 1, unit_price: 5.69)
    #transactions
    @transaction_1 = @invoice_1.transactions.create!(credit_card_number: 123456789, credit_card_expiration_date: '', result: 'success')
    @transaction_2 = @invoice_2.transactions.create!(credit_card_number: 113456789, credit_card_expiration_date: '', result: 'success')
    @transaction_3 = @invoice_3.transactions.create!(credit_card_number: 111456789, credit_card_expiration_date: '', result: 'success')
    @transaction_4 = @invoice_4.transactions.create!(credit_card_number: 111156789, credit_card_expiration_date: '', result: 'success')
    @transaction_5 = @invoice_5.transactions.create!(credit_card_number: 111116789, credit_card_expiration_date: '', result: 'success')
    @transaction_6 = @invoice_6.transactions.create!(credit_card_number: 111111789, credit_card_expiration_date: '', result: 'success')
    @transaction_7 = @invoice_7.transactions.create!(credit_card_number: 111111189, credit_card_expiration_date: '', result: 'success')
    @transaction_8 = @invoice_8.transactions.create!(credit_card_number: 111111119, credit_card_expiration_date: '', result: 'success')
  end

  it "sends the favorite merchant associated with one customer" do

    get "/api/v1/customers/#{@customer_2.id}/favorite_merchant"

    expect(response).to be_successful

    customer_response = JSON.parse(response.body)
    expect(customer_response["data"]["attributes"]["id"]).to eq(@merchant_4.id)
  end
end
