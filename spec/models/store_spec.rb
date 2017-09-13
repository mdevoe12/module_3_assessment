require 'rails_helper'

RSpec.describe Store, type: :model do
  it "returns search results in json" do
    VCR.use_cassette("features/user_can_search_for_best_buys_spec.rb") do

      result = Store.find_stores("80202")

      expect(result.count).to eq(10)
    end
  end
end
