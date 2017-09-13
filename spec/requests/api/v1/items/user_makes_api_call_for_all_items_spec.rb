require 'rails_helper'

describe 'items api' do
  it 'returns all items' do
    create_list(:item, 3)

    get '/api/v1/items'

    items = JSON.parse(response.body)

    expect(status).to be(200)
    expect(items.count).to eq(3)
    expect(items[0]["name"]).to eq(Item.first.name)
    expect(items[0]["description"]).to eq(Item.first.description)
    expect(items[0]["image_url"]).to eq(Item.first.image_url)
  end
end
