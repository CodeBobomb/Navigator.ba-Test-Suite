describe 'Navigator.ba regression test: Create place' do
	
	before :all do
		@homescreen=HomeScreen.new
		@createscreen=CreateScreen.new
		@placescreen=PlaceScreen.new
	end

	context 'Press the Create place button' do
		it 'button pressed' do
			expect(@homescreen.nav_bar('Create Place')).to be_eql('CREATE PLACE')
		end
	end

	context "Enter place name: 'CKMD-3' " do
		it 'place name entered' do
			expect(@createscreen.add_name('CKMD-3')).to eql('CKMD-3')
		end
	end

	context "Press the Address item" do
		it "address screen appeared" do
			expect(@createscreen.open_address_screen).to be_eql('ADDRESS')
		end
	end

	context "Set street: 'Zmaja od Bosne', house number: '10', city: 'Sarajevo' and zip:'71000' as adress data" do
		it "address data set" do
			expect(@createscreen.set_address('Zmaj od Bosne','10','Sarajevo','71000')).to match_array([true,true,true,true])
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
			expect(@createscreen.select_primary_category('Coffee')).to match_array(['Coffee'])
		end
	end

	context "Add 'Studentski kafic' as additional comment" do
		it 'comment added' do
			expect(@createscreen.add_comment('Studentski kafic')).to be_truthy
		end
	end

	context "Open the map screen" do
		it 'map opened' do
			expect(@createscreen.open_map_screen).to eql('SELECT LOCATION')
		end
	end

	context "Drag the pin across the screen and save location" do
		it "pin draged and location saved" do
			expect(@createscreen.drag_pin).to be_truthy
		end
	end

	context "Press the Create place button" do
		it "place created" do
			expect(@createscreen.save_button).to be_truthy
		end
	end

	context "Return to Home screen" do
		it "returned to home screen" do
			@createscreen.previous_screen
			expect(@homescreen.on_screen?).to be_truthy
		end		
	end

	context "Enter 'CKMD3' in search box, select first result" do
		it "place entered, place searched" do
			expect(@homescreen.search_place('CKMD3')).to be_eql('CKMD-3')
		end
	end

	context "Check if all required fields exist" do
		it "required fields exist" do 	
			expect(@placescreen.required_details_exist?).to be_truthy
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