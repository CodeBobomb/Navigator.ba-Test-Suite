require 'appium_lib'
require_relative '../../lib/viewscreens/viewscreen.rb'

describe 'Appium test' do



	context "Enter 'Atlantbh' in search box, select first result" do
		it "place entered, place searched" do
			expect(ViewScreen::HomeScreen.search_place('Atlantbh')).to be_truthy
		end
	end

	context "Check if all required fields exist" do
		it "required fields exist" do 	
			expect(ViewScreen::PlaceScreen.details_exist?).to be_truthy
		end
	end

 	context "Rate the place with 5 stars" do
		it "place rated" do
			expect(ViewScreen::PlaceScreen.rate_place(5)).to be_truthy
		end
	end

	context "Browse the gallery" do
		it "gallery browsed" do
			expect(ViewScreen::PlaceScreen.browse_gallery).to be_truthy
		end
	end

	context "Press the Map button on options menu and check pin content" do
		it "map viewscreen appeared and content verified" do
			expect(ViewScreen::PlaceScreen.check_map?).to be_truthy
		end
	end

	context "Return to Home viewscreen" do
		it "returned to home viewscreen" do
			ViewScreen::PlaceScreen.previous_screen
			expect(ViewScreen::HomeScreen.on_screen?).to be_truthy
		end
	end
end