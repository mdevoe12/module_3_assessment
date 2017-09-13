class SearchController < ApplicationController

  def index
    @conn = Faraday.new(url: "https://api.bestbuy.com")
    binding.pry
  end

end
