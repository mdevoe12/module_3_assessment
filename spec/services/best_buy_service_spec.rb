require 'rails_helper'

RSpec.describe BestBuyService do
  it "makes connection" do
    conn = BestBuyService.connect

    expect(conn.class).to eq(Faraday::Connection)
  end

  it "returns the url for finding by zip" do
    zip = "80211"
    search_params = "sample"
    result = BestBuyService.find_zip_url(zip)

    expect(result).to eq("/v1/stores(area(80211,25))?format=json&show=storeType,longName,city,phone,distance&&apiKey=#{ENV['bb_key']}")
  end

  it "returns the search params" do
    result = BestBuyService.search_params

    expect(result).to eq("?format=json&show=storeType,longName,city,phone,distance&&apiKey=#{ENV['bb_key']}")
  end

  it "returns the api key param" do
    result = BestBuyService.api_key

    expect(result).to eq("&apiKey=#{ENV['bb_key']}")
  end
end
