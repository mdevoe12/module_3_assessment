require 'rails_helper'

RSpec.describe BestBuyService do
  it "makes connection" do
    conn = BestBuyService.connect

    expect(conn.class).to eq(Faraday::Connection)
  end
end
