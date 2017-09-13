require 'rails_helper'

RSpec.feature 'a user can see items' do
  scenario 'when they visit the root path' do
    items = create_list(:item, 3)

    visit root_path

    expect(page).to have_css(".col-sm-3")
    # first(".col-sm-3").should have_content(Item.first.name)
    within(first(".col-sm-3")) do
      expect(page).to have_content(Item.first.name)
      expect(page).to have_content(Item.first.description)
      expect(page).to have_css("img")
    end
  end
end
