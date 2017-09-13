class BestBuyService

  def self.find_by_zip(zip)
    @conn = Faraday.new(url: "https://api.bestbuy.com")
    response = @conn.get("/v1/stores(area(#{zip},25))?format=json&show=storeType,longName,city,phone,distance&apiKey=#{ENV['bb_key']}")
    result = JSON.parse(response.body, symbolize_names: :true)[:stores]
  end

end
