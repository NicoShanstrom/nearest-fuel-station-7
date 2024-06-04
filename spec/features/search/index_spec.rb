require "rails_helper"

RSpec.describe "Search" do
  it "shows the nearest electric charging station to starting location" do
    VCR.use_cassette('nearest_electric_fuel_station') do
      visit root_path

      select "Griffin Coffee", from: :location
      click_button "Find Nearest Station"

      expect(page).to have_content("Nearest Electric Fuel Station")

      within("#station_info") do
        expect(page).to have_content("Name: Edgewater Public Market - Tesla Supercharger")
        expect(page).to have_content("Address: 5505 W 20th Ave, Edgewater, CO 80214")
        expect(page).to have_content("Fuel Type: ELEC")
        expect(page).to have_content("Access Times: 24 hours daily")
      end

      expect(page).to have_content("Distance: 0.6829 miles")
      expect(page).to have_content("Travel Time: 00:02:52")

      within("#directions") do
        expect(page).to have_content("Directions")
        expect(page).to have_content("Head south. Go for 75 ft.")
        expect(page).to have_content("Turn left toward Sheridan Blvd/CO-95. Go for 177 ft")
        expect(page).to have_css('ol li', minimum: 1)
      end
    end
  end
end