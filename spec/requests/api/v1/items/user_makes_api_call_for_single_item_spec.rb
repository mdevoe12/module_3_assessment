require 'rails_helper'

describe 'items api' do
  it 'returns single item' do
    create(:item)

    get '/api/v1/items/1'

    item = JSON.parse(response.body)

    expect(status).to be(200)
    expect(item["id"]).to eq(Item.first.id)
    expect(item["name"]).to eq(Item.first.name)
    expect(item["description"]).to eq(Item.first.description)
    expect(item["image_url"]).to eq(Item.first.image_url)    
  end
end
