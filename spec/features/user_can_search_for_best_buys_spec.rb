require 'rails_helper'

RSpec.feature "a user can see a list of best buy stores" do
  scenario "when they fill in the search bar with a zip" do
    visit root_path

    expect(page).to have_css(".form-inline")

    VCR.use_cassette("features/user_can_search_for_best_buys_spec.rb") do

      fill_in :search, with: "80202"
      click_on "Search"

      expect(current_path).to eq(search_index_path)
      expect(page).to have_content("total stores near you")
      within(first(".store")) do
        expect(page).to have_content("Cherry Creek Shopping Center")
        expect(page).to have_content("Denver")
        expect(page).to have_content("3.45")
        expect(page).to have_content("303-270-9189")
        expect(page).to have_content("Mobile SAS")
      end
      expect(all(".store").count).to eq(10)
    end
  end
end
