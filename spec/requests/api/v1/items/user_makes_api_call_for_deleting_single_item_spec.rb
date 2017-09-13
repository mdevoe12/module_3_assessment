require 'rails_helper'

describe 'items api' do
  it 'deletes single item' do
    create_list(:item, 2)

    expect(Item.count).to eq(2)

    delete '/api/v1/items/1'

    expect(status).to be(204)
    expect(Item.count).to eq(1)
  end
end
