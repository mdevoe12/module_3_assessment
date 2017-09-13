class BestBuyService

  def self.connect
    Faraday.new(url: "https://api.bestbuy.com")
  end

  def self.find_by_zip(zip)
    response = connect.get(find_zip_url(zip))
    result = JSON.parse(response.body, symbolize_names: :true)[:stores]
  end

  def self.find_zip_url(zip)
    "/v1/stores(area(#{zip},25))#{search_params}"
  end

  def self.search_params
    "?format=json&show=storeType,longName,city,phone,distance&#{api_key}"
  end

  def self.api_key
    "&apiKey=#{ENV['bb_key']}"
  end

end
