class SearchController < ApplicationController

  def index
    @conn = Faraday.new(url: "https://api.bestbuy.com")
    response = @conn.get("/v1/stores(area(80202,25))?format=json&show=storeType,longName,city,phone,distance&apiKey=zvkqfuc5vws6ytvedk2qwf4n")
    result = JSON.parse(response.body)
    binding.pry
  end

end
