require 'rails_helper'

describe 'items api' do
  it 'creates single item' do
    item = {
      name: "donut",
      description: "it's delicious",
      image_url: "http://lorempixel.com/400/200/"
    }

    post '/api/v1/items', item

    expect(status).to be(201)
    expect(Item.count).to eq(1)
  end
end
