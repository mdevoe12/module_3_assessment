require 'rails_helper'

describe 'items api' do
  it 'creates single item' do
    item = {
      name: "donut",
      description: "it's delicious",
      image_url: "http://lorempixel.com/400/200/"
    }

    post '/api/v1/items', item

    result = JSON.parse(response.body)
    expect(status).to be(201)
    expect(Item.count).to eq(1)
    expect(result["body"]["id"]).to eq(Item.first.id)
    expect(result["body"]["name"]).to eq(Item.first.name)
    expect(result["body"]["description"]).to eq(Item.first.description)
    expect(result["body"]["image_url"]).to eq(Item.first.image_url)
  end
end
