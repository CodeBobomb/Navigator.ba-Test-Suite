describe 'Navigator.ba regression test: Suggest changes with invalid values' do

	before :all do
		@homescreen=HomeScreen.new
		@createscreen=CreateScreen.new
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

	context "Open the name change screen and change name to '123!~!dAta!~!123'" do
		it 'error popup appeared, stayed on name change screen, returned to place viewscreen' do
			expect(@changesscreen.try_name_change('123!~!dAta!~!123')).to eql('NAZIV')
		end
	end

	context "Click the 'Suggest Changes' button" do
		it 'changes screen opened' do
			expect(@placescreen.open_changes_screen).to eql('PREDLOŽI IZMJENE')
		end
	end

	context "Open the address change screen and change address to: '321!~!dAta!~!123', '123!~!dAta!~!123', '123!~!dAta!~!123','0123456789' " do
 		it 'error popup appeared,stayed on address change screen, returned to place viewscreen' do
 			expect(@changesscreen.try_address_change('321!~!dAta!~!123','123!~!dAta!~!123','123!~!dAta!~!123','0123456789','123!~!dAta!~!123')).to eql('ADRESA')
 		end
 	end

 	context "Click the 'Suggest Changes' button" do
		it 'changes screen opened' do
			expect(@placescreen.open_changes_screen).to eql('PREDLOŽI IZMJENE')
		end
	end

	context "Open the contact change screen, and change contact details to: '123!~!dAta!~!123', '123!~!dAta!~!123',123456789,'123!~!dAta!~!123'" do
		it 'error popup appeared, stayed on contact changed screen, returned to place viewscreen' do
			expect(@changesscreen.try_contact_change('123!~!dAta!~!123','123!~!dAta!~!123','123456789','123!~!dAta!~!123')).to eql('KONTAKT INFO')
		end
	end

	context "Return to home viewscreen" do
		it 'returned to home viewscreen' do
			@placescreen.previous_screen
			expect(@homescreen.on_screen?).to be_truthy
		end
	end
end