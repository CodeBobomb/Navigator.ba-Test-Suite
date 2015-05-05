require 'appium_lib'

describe "Navigator.ba regression test: Venues" do

	before :all do
		@homescreen = HomeScreen.new
		@placescreen = PlaceScreen.new
		@listscreen = ListScreen.new 
	end

	context "Click the: 'Glavne lokacije' item on the homescreen" do
		it "list viewscreen appeared" do
			expect(@homescreen.open_main_item('Glavne lokacije')).to be_truthy
		end
	end

	context "Select 'BKC Festival Center + Box Office' on the venues list" do
		it "venue selected, place viewscreen appeared" do
			@listscreen.open_item('BKC Festival Center + Box Office')
		 	expect(@placescreen.required_details_exist?).to be_truthy
		end
	end

	context "Press the Map button on options menu and check pin content" do
		it "map viewscreen appeared and pin content verified" do
			expect(@placescreen.check_map?).to be_truthy
		end
	end

	context "Return to home viewscreen" do
		it "returned to home viewscreen" do
			@placescreen.previous_screen
			@listscreen.previous_screen
			expect(@homescreen.on_screen?).to be_truthy
		end
	end
end