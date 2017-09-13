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
    BestBuyService.find_by_zip(zip).map do |raw_stores|
      Store.new(raw_stores)
    end
  end

end
