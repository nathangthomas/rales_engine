require 'rails_helper'
require 'pry'

describe "Merchants API" do
  it "sends a list of merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'
    expect(response).to be_successful
    merchants = JSON.parse(response.body)

    expect(merchants["data"].count).to eq(3)
  end

  it "can get one item by its id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["data"]["id"].to_i).to eq(id)
  end

  it "can return a single object representation with any of its attributes" do
    merchant = create(:merchant)
    create(:merchant)
    #this is how you create a new merchant with factory bot

    get "/api/v1/merchants/find?name=#{merchant.name}"


    merchant_response = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merchant.id).to eq(merchant_response["data"]["id"].to_i)
    #this and next test need to test for param being case insinsitive -- come back to this if you have more time.
  end

  it "can return all matches for the given query for all attributes" do
    merchant = create(:merchant)

    get "/api/v1/merchants/find_all?name=#{merchant.name}"

    merchant_response = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merchant.name).to eq(merchant_response["data"][0]["attributes"]["name"])
  end
end
