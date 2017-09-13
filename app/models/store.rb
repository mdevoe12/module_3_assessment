class Store


  def self.find_stores(zip)
    @conn = Faraday.new(url: "https://api.bestbuy.com")
    response = @conn.get("/v1/stores(area(#{zip},25))?format=json&show=storeType,longName,city,phone,distance&apiKey=#{ENV['bb_key']}")
    result = JSON.parse(response.body)
    
  end

end
