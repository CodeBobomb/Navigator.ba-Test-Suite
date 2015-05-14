describe "Navigator.ba regression test: Theaters" do

	before :all do
		@homescreen = HomeScreen.new
		@placescreen = PlaceScreen.new
		@listscreen = ListScreen.new 
	end
	
	context "Click the 'Kina' item on the home viewscreen" do
		it 'list viewcreen with theaters appeared' do
			expect(@homescreen.open_main_item('Theatres')).to eql('THEATRES')
		end
	end	

	context "Select 'Ljetno kino HT Eronet' item in the list" do
		it 'theater selected, place viewscreen appeared' do
			@listscreen.open_item('Ljetno kino HT Eronet')
			expect(@placescreen.required_details_exist?).to be_truthy
		end
	end

	context "Press the Map button on options menu and check pin content" do
		it "map viewscreen appeared and pin content verified" do
			expect(@placescreen.check_map).to match_array([true,true,true])
		end
	end

	context  "Return to home viewscreen" do
		it "returned to home viewscreen" do
			@placescreen.previous_screen
			@listscreen.previous_screen
			expect(@homescreen.on_screen?).to be_truthy
		end
	end
end