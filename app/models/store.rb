class Store

  attr_reader :name,
              :city,
              :distance,
              :phone,
              :type

  def initialize(info = {})
    @name     = info[:longName]
    @city     = info[:city]
    @distance = info[:distance]
    @phone    = info[:phone]
    @type     = info[:storeType]
  end


  def self.find_stores(zip)
    @conn = Faraday.new(url: "https://api.bestbuy.com")
    response = @conn.get("/v1/stores(area(#{zip},25))?format=json&show=storeType,longName,city,phone,distance&apiKey=#{ENV['bb_key']}")
    result = JSON.parse(response.body, symbolize_names: :true)[:stores]
    result.map do |raw_stores|
      Store.new(raw_stores)
    end
  end

end
