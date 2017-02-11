require 'rails_helper'

describe "user can search via zip" do
  scenario "/search" do
    visit root_url

    fill_in :q, with: "80202"

    click_button "Find Events"
    expect(current_path).to eq "/search"
    expect(page).to have_content "16 events in March"
    expect(page).to have_content "Experience Hendrix"
    expect(page).to have_content "Paramount Theatre"
    expect(page).to have_content "2017-03-07"
    expect(page).to have_content "1621 Glenarm Place"
    expect(page).to have_selector(:css, 'a[href="http://denver.eventful.com/venues/paramount-theatre-/V0-001-000198697-3?utm_source=apis&utm_medium=apim&utm_campaign=apic"]')
  end
end

# As a user,
# When I fill in the search with 80202,
# And I click Find Events,
# The current path is `/search`,
# And I can see a list of 16 events with a header `16 events for March', sorted by popularity.
# For each event I can see the Event name, date & time, description (shortened to 140 characters), venue name (url to the venue page), venue address.
