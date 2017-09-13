require 'rails_helper'

describe 'items api' do
  it 'returns all items' do
    create_list(:item, 2)

    get '/api/v1/items'

    items = JSON.parse(response.body)

    expect(status).to be(200)
    expect(items.count).to eq(2)
    expect(items["body"][0]["name"]).to eq(Item.first.name)
    expect(items["body"][0]["description"]).to eq(Item.first.description)
    expect(items["body"][0]["image_url"]).to eq(Item.first.image_url)
    expect(items["body"][1]["name"]).to eq(Item.last.name)
    expect(items["body"][1]["description"]).to eq(Item.last.description)
    expect(items["body"][1]["image_url"]).to eq(Item.last.image_url)
  end
end
