require 'rails_helper'

describe 'items api' do
  it 'returns single item' do
    create(:item)

    get '/api/v1/items/1'

    item = JSON.parse(response.body)

    expect(status).to be(200)
  
  end
end
