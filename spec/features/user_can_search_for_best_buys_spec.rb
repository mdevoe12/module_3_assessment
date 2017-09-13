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
    end
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "17 Total Stores"
# And I should see exactly 10 results (There are 17 stores within 25 miles. We want to display 10 on this page and 7 on the next. Get the first page to work first from start to finish and worry about pagination later.)
# And I should see the long name, city, distance, phone number and store type for each of the 10 results
  end
end
