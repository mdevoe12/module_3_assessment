require 'rails_helper'

describe 'items api' do
  it 'deletes single item' do
    create(:item)

    delete '/api/v1/items/1'

    item = JSON.parse(response.body)

    expect(status).to be(204)
    expect(Item.count).to eq(0)
  end
end
