class SearchController < ApplicationController

  def index
    @conn = Faraday.new(url: "https://api.bestbuy.com")
    response = @conn.get("/v1/stores(area(#{params[:search]},25))?format=json&show=storeType,longName,city,phone,distance&apiKey=#{ENV['bb_key']}")
    result = JSON.parse(response.body)
    @stores = Store.find_stores(params[:search])
  end

end
