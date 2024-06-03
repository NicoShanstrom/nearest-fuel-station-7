require "rails_helper"

RSpec.describe "Search" do
  it "shows the nearest electric charging station to starting location" do
    VCR.use_cassette('nearest_electric_charging_station') do
      visit root_path

      select "Griffin Coffee", from: :location
      click_button "Find Nearest Station"

      expect(page).to have_content("Nearest Electric Fuel Station")

      within("#station_info") do
        expect(page).to have_content("Name:")
        expect(page).to have_content("Address:")
        expect(page).to have_content("Fuel Type:")
        expect(page).to have_content("Access Times:")
      end

      expect(page).to have_content("Distance:")
      expect(page).to have_content("Travel Time:")

      within("#directions") do
        expect(page).to have_content("Directions")
        expect(page).to have_css('ol li', minimum: 1)
      end
    end
  end
end