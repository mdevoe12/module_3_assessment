require 'rails_helper'

describe 'items api' do
  it 'returns all items' do
    create_list(:items, 3)

    get '/api/v1/items'

    items = JSON.parse(response.body)

    expect(status).to be(200)
    expect(items.count).to eq(30)
  end
end
