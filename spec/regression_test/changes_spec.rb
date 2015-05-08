describe "Navigator.ba mobile app regression test: Suggest changes" do

	before :all do
		@homescreen=HomeScreen.new
		@listscreen=ListScreen.new
		@placescreen=PlaceScreen.new
		@changesscreen=ChangesScreen.new
	end

	context "Enter place name:'Sloga' and open it" do
		it 'place name entered, place viewscreen appeared' do
			expect(@homescreen.search_place('Sloga')).to be_eql('CINEMAS SLOGA CLUB')
		end
	end

	context "Click the 'Suggest Changes' button" do
		it 'changes screen opened' do
			expect(@placescreen.open_changes_screen).to eql('PREDLOŽI IZMJENE')
		end
	end

	context "Check if all changes options exist" do
		it 'all options exist' do
			expect(@changesscreen.required_fields_exist?).to be_truthy
		end
	end

	context "Open the name screen" do
		it 'name screen opened' do
			expect(@changesscreen.open_name_screen).to eql('NAZIV')
		end
 	end

 	context "Open the category screen" do
 		it 'category screen opened' do
 			expect(@changesscreen.open_category_screen).to eql('KATEGORIJA')
 		end
 	end

 	context "Open the address screen" do
 		it 'address screen opened' do
 			expect(@changesscreen.open_address_sceen).to eql('ADRESA')
 		end
 	end

 	context "Open the contact screen" do
 		it 'contact screen opened' do
 			expect(@changesscreen.open_contact_screen).to eql('KONTAKT INFO')
 		end
 	end

 	context "Open the map screen" do
 		it 'map sceen opened' do
 			expect(@changesscreen.open_map_screen).to eql('LOKACIJA')
 		end
 	end

 	context "Open the comment sceen" do
 		it 'comment screen opened' do
 			expect(@changesscreen.open_comment_screen).to eql('DRUGE IZMJENE')
 		end
 	end

 	context "Return to place viewscreen" do
 		it 'popup message appeared, returned to placescreen' do
 			expect(@changesscreen.return_to_placescreen(1)).to be_falsey
 		end
 	end

 	context "Click the 'Suggest Changes' button" do
		it 'changes screen opened' do
			expect(@placescreen.open_changes_screen).to eql('PREDLOŽI IZMJENE')
		end
	end

	context "Open the name change screen and change the name to 'Sloga-test'" do
		it 'name change suggested and returned to place viewscreen' do
			@changesscreen.open_name_screen('Sloga-test')
			expect(@placescreen.required_details_exist?).to be_truthy
		end
 	end

 	context "Return to home viewcreen" do
 		it 'returned to home viewscreen' do
 			@placescreen.previous_screen
 			expect(@homescreen.on_screen?).to be_truthy
 		end
 	end
end