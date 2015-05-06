describe 'Navigator.ba smoke test' do
	before :all do
		@homescreen=HomeScreen.new
		@placescreen=PlaceScreen.new
	end

	context "Enter 'Sloga' in search box, select first result" do
		it "place entered, place searched" do
			expect(@homescreen.search_place('Sloga')).to be_eql('CINEMAS SLOGA CLUB')
		end
	end

	context "Check if all required fields exist" do
		it "required fields exist" do 	
			expect(@placescreen.full_details_exist?).to be_truthy
		end
	end

 	context "Rate the place with 5 stars" do
		it "place rated" do
			expect(@placescreen.rate_place(5)).to eql(5)
		end
	end

	context "Browse the gallery" do
		it "gallery browsed" do
			expect(@placescreen.browse_gallery).to match_array([true,true])
		end
	end

	context "Press the Map button on options menu and check pin content" do
		it "map viewscreen appeared and content verified" do
			expect(@placescreen.check_map).to match_array([true,true,true])
		end
	end

	context "Return to Home viewscreen" do
		it "returned to home viewscreen" do
			@placescreen.previous_screen
			expect(@homescreen.on_screen?).to be_truthy
		end
	end
end