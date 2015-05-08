describe 'Navigator.ba regression test: Create place with invalid values' do
	
	before :all do
		@homescreen=HomeScreen.new
		@createscreen=CreateScreen.new
		@placescreen=PlaceScreen.new
	end

	context 'Press the Create place button' do
		it 'button pressed' do
			expect(@homescreen.nav_bar('Kreiraj Objekat')).to be_eql('KREIRAJ OBJEKAT')
		end
	end

	context "Press the Create place button" do
		it 'error popup message appeared, stayed on create viewscreen' do
			@createscreen.save_button
			expect(@placescreen.required_details_exist?).to be_falsey
		end
	end

	context "Enter place name: '123!~!dAta!~!123' " do
		it 'place name entered' do
			expect(@createscreen.add_name('123!~!dAta!~!123')).to eql('123!~!dAta!~!123')
		end
	end

	context "Press the Create place button" do
		it 'error popup message appeared, stayed on create viewscreen' do
			@createscreen.save_button
			expect(@placescreen.required_details_exist?).to be_falsey
		end
	end

	context "Press the Address item" do
		it "address screen appeared" do
			expect(@createscreen.open_address_screen).to be_eql('ADRESA')
		end
	end

	context "Set street: '123!~!dAta!~!123' as adress data" do
		it "address data set" do
			expect(@createscreen.set_address('321!~!dAta!~!123','123!~!dAta!~!123','123!~!dAta!~!123','123123123')).to be_falsey
		end
	end

	context "Press the Create place button" do
		it 'error popup message appeared, stayed on create viewscreen' do
			@createscreen.save_button
			expect(@placescreen.required_details_exist?).to be_falsey
		end
	end

	context "Press the Primary category item" do
		it "category screen appeared" do
			@createscreen.open_category_screen
			expect(@createscreen.number_of_categories).to be > 0
		end
	end

	context "Select 'Kafa' as primary category and no subcategory" do
		it 'primary category selected' do
			expect(@createscreen.select_primary_category('Kafa')).to match_array(['Kafa'])
		end
	end

	context "Press the Create place button" do
		it 'error popup message appeared, stayed on create viewscreen' do
			@createscreen.save_button
			expect(@placescreen.required_details_exist?).to be_falsey
		end
	end

	context "Open the map screen" do
		it 'map opened' do
			expect(@createscreen.open_map_screen).to eql('ODABERITE LOKACIJU')
		end
	end

	context "Drag the pin across the screen and save location" do
		it "pin draged and location saved" do
			expect(@createscreen.drag_pin).to be_truthy
		end
	end

	context "Press the Create place button" do
		it "place created" do
			expect(@createscreen.save_button).to be_falsey
		end
	end
end