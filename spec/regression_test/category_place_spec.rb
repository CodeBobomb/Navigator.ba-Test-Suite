describe "Navigator.ba mobile app regression test: Category list place browsing" do

	before :all do
		@homescreen=HomeScreen.new
		@listscreen=ListScreen.new
		@placescreen=PlaceScreen.new
	end

	context "Click the 'Hrana' item in the cateogry list" do
		it 'category item clicked, list viewscreen with food places appeared' do
			expect(@homescreen.open_main_item('HRANA')).to eql('HRANA')
		end
	end

	context "Select the '4 Sobe Gospođe Safije' on place list" do
		it 'place selected, place viewscreen appeared' do
			@listscreen.open_item('4 Sobe Gospođe Safije')
			expect(@placescreen.required_details_exist?). to be_truthy
		end
	end

	context "Press the Map button on options menu and check pin content" do
		it "map viewscreen appeared and pin content verified" do
			expect(@placescreen.check_map).to match_array([true,true,true])
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